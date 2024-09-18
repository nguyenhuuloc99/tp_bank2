import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tp_bank/utils/extensions.dart';
import 'package:tp_bank/utils/shared.dart';

import '../../service/repository/login_repository.dart';
import 'login_success_state_cubit.dart';

class LoginSuccessCubit extends Cubit<LoginSuccessState> {
  LoginRepository loginRepository;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginSuccessCubit({required this.loginRepository})
      : super(LoginSuccessInitial());

  void login(BuildContext context) async {
    if (passwordController.text.isNullOrEmpty) {
      showDialogEmptyField(context);
      return;
    }
    try {
      emit(LoginLoading(true));
      var response = await loginRepository.executeLogin(
          SharedManager.instance.getUserName, passwordController.text);
      if (response == 200) {
        emit(LoginSuccess());
        SharedManager.instance.save(userNameController.text, 'userName');
        SharedManager.instance.save(true, 'Login');
      }
    } catch (e) {
      emit(LoginLoading(false));
      showDialogError(context);
      emit(LoginError(errorType: ErrorType.loginError));
    }
  }

  void showDialogEmptyField(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Thông báo',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF7B35BB)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Tên đăng nhập hoặc mật khẩu không được để trống',
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: const Text('Đồng ý'),
                  )
                ],
              ),
            ),
          );
        });
  }

  void showDialogError(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Đăng Nhập Thất Bại',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF7B35BB)),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                      'Tên đăng nhập hoặc mật khẩu không đúng. Tài khoản của Bạn sẽ bị khoá nếu nhập sai 5 lần!'),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.pop();
                        },
                        child: const Text(
                          'THỬ LẠI',
                          style: TextStyle(color: Color(0xFF7B35BB)),
                        ),
                      ),
                      const SizedBox(width: 16),
                      GestureDetector(
                        onTap: () {
                          context.pop();
                        },
                        child: const Text(
                          'QUÊN MẬT KHẨU',
                          style: TextStyle(color: Color(0xFF7B35BB)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
