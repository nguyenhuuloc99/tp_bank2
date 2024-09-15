import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tp_bank/presentation/cubit/login_cubit.dart';

import '../../cubit/login_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              switch (state) {
                case LoginInitial():
                case LoginLoading():
                case LoginSuccess():
                  context.push('/loginSuccess');
                case LoginError():
                  if (state.errorType == ErrorType.emptyField) {
                    showDialogEmptyField(context);
                  } else {
                    showDialogError(context);
                  }
              }
            },
            builder: (context, state) {
              return Column(
                children: [],
              );
            },
          ),
        ),
      ),
    );
  }

  void showDialogEmptyField(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text(
                    'Thông báo',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  const Text('Tên png nhập hoặc mật khẩu không được để trống'),
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
                children: [
                  const Text(
                    'Đăng Nhập Thất Bại',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                        child: const Text('THỬ LẠI'),
                      ),
                      const SizedBox(width: 16),
                      GestureDetector(
                        onTap: () {
                          context.pop();
                        },
                        child: const Text('QUÊN MẬT KHẨU'),
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
