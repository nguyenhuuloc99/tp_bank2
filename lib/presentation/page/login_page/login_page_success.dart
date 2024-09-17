import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tp_bank/presentation/cubit/login_cubit.dart';
import 'package:tp_bank/presentation/cubit/login_state.dart';

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
                  image: AssetImage("assets/images/bg_image.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: BlocListener<LoginCubit, LoginState>(
                listener: (context, state) {
                  switch (state) {
                    case LoginInitial():
                      break;
                    case LoginLoading():
                      break;
                    case LoginSuccess():
                      context.pushReplacement('/lg2');
                      break;
                    case LoginError():
                  }
                },
                child: Column(
                  children: [
                    const SizedBox(height: 280),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: TextFormField(
                        controller: context.read<LoginCubit>().passwordController,
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
                    const SizedBox(height: 60),
                    GestureDetector(
                      onTap: () {
                        context.read<LoginCubit>().login(context);
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
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
