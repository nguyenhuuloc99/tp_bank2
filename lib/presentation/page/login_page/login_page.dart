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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: true,
        bottom: true,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusScope.of(context).unfocus(),
          child: BlocConsumer<LoginCubit, LoginState>(
            listenWhen: (p, c) {
              return p != c;
            },
            listener: (context, state) {
              switch (state) {
                case LoginInitial():
                  break;
                case LoginLoading():
                  break;
                case LoginSuccess():
                  context.pushReplacement('/loginSuccess');
                  break;
                case LoginError():
                  if (state.errorType == ErrorType.emptyField) {
                    showDialogEmptyField(context);
                  } else {
                    showDialogError(context);
                  }
                  break;
              }
            },
            builder: (context, state) {
              return Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/bg_image.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 160),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white70),
                        decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: Color(0xFFC48066),
                            ),
                            suffixIcon:
                                Icon(Icons.info, color: Color(0xFFC48066)),
                            hintText: 'Tên đăng nhập ',
                            fillColor: Colors.transparent,
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(),
                            )),
                        controller:
                            context.read<LoginCubit>().userNameController,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white70),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Color(0xFFC48066),
                          ),
                          suffixIcon: Icon(Icons.remove_red_eye,
                              color: Color(0xFFC48066)),
                          hintText: 'Mật khẩu',
                          hintStyle: TextStyle(color: Colors.grey),
                          fillColor: Colors.transparent,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        controller:
                            context.read<LoginCubit>().passwordController,
                      ),
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {
                        context.read<LoginCubit>().login();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(horizontal: 32),
                        padding: const EdgeInsets.all(16),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color(0xFF7B35BB),
                            borderRadius: BorderRadius.circular(12)),
                        child: const Text(
                          'ĐĂNG NHẬP',
                          style: TextStyle(
                              color: Color(0xFFC48066),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 32),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(16),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color(0xFF7B35BB),
                            borderRadius: BorderRadius.circular(12)),
                        child: const Text(
                          'MỞ TÀI KHOẢN ONLINE',
                          style: TextStyle(
                              color: Color(0xFFC48066),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
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
                mainAxisSize: MainAxisSize.min,
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
                mainAxisSize: MainAxisSize.min,
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
