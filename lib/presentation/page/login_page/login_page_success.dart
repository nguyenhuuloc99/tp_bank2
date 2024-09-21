import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tp_bank/presentation/cubit/login_success_cubit.dart';
import 'package:tp_bank/presentation/cubit/login_success_state_cubit.dart';

import '../../../utils/shared.dart';

class LoginPageSuccess extends StatelessWidget {
  const LoginPageSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg_app.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 100),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Xin chào',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              SharedManager.instance.getUserName(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              'Chúc bạn một ngày mới tốt lành',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            context.push('/login');
                          },
                          child: Image.asset('assets/images/icon_back.png'),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 100),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: TextFormField(
                      controller:
                          context.read<LoginSuccessCubit>().passwordController,
                      style: const TextStyle(color: Colors.white70),
                      obscureText: true,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.white70,
                          ),
                          suffixIcon: Icon(Icons.remove_red_eye,
                              color: Color(0xFFC48066)),
                          hintText: 'Mật khẩu',
                          hintStyle: TextStyle(color: Colors.grey),
                          fillColor: Colors.transparent,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(),
                          )),
                    ),
                  ),
                  BlocBuilder<LoginSuccessCubit, LoginSuccessState>(
                      builder: (context, state) {
                    return Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 5),
                      child: Text(
                        state.message ?? '',
                        style: const TextStyle(
                          color: Color(0xFFC48066),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    );
                    return const SizedBox.shrink();
                  }),
                  const SizedBox(height: 80),
                  GestureDetector(
                    onTap: () {
                      context.read<LoginSuccessCubit>().login(context);
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
                        'Đăng nhập',
                        style: TextStyle(
                            color: Color(0xFFC48066),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
