import 'package:dio/dio.dart';
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
      print('-----------${SharedManager.instance.getUserName}');
      emit(LoginLoading(true));
      var response = await loginRepository.executeLogin(
          SharedManager.instance.getUserName(), passwordController.text);
      if (response['status'] == 200) {
        SharedManager.instance.save(userNameController.text, 'userName');
        SharedManager.instance.setUserName(userNameController.text,);
        emit(LoginSuccess());
        SharedManager.instance.save(true, 'Login');
      }
    } catch (e) {
      if (e is DioError) {

        // The server responded with a non-2xx status code
        print('Error response data: ${e.response?.data}');
        print('Error status code: ${e.response?.statusCode}');
        if(e.response?.statusCode == 500) {
          showDialogError(context,'Your account is locked!' );
        } else {
          showDialogError(context,'Incorrect username or password' );
        }

      } else {
        // Other errors
        print('Unexpected error: $e');
      }
      emit(LoginLoading(false));
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

  void showDialogError(BuildContext context, String message) {
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
                   Text(message),
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