import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tp_bank/presentation/cubit/login_cubit.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../cubit/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    context.read<LoginCubit>().userNameController.text = '';
    context.read<LoginCubit>().passwordController.text = '';
    super.initState();
  }

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
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg_app_2.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Image.asset(
                    'assets/images/tpb_logo.png',
                    width: 150,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
                const Center(
                  child: Text('TpBank xin chào Bạn!'),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.heart_broken_sharp),
                    Icon(Icons.heart_broken_sharp),
                    Icon(Icons.heart_broken_sharp),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        style: const TextStyle(
                            color: Colors.white70, fontFamily: 'roboto'),
                        decoration: InputDecoration(
                            prefixIcon: SizedBox(
                              height: 1,
                              width: 1,
                              child: FittedBox(
                                child: SvgPicture.asset(
                                  'assets/images/ic_account.svg',
                                  width: 1,
                                  height: 1,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                            filled: true,
                            hintText: 'Tên đăng nhập',
                            contentPadding:
                                const EdgeInsets.only(left: 40, top: 5),
                            fillColor: const Color(0xFF9086A9),
                            hintStyle: const TextStyle(color: Colors.black38),
                            suffixIcon: SizedBox(
                              height: 1,
                              width: 1,
                              child: FittedBox(
                                child: SvgPicture.asset(
                                  'assets/images/ic_info.svg',
                                  width: 1,
                                  height: 1,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(),
                            )),
                        controller:
                            context.read<LoginCubit>().userNameController,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        style: const TextStyle(
                            color: Colors.white70, fontFamily: 'roboto'),
                        obscureText: true,
                        decoration: InputDecoration(
                            prefixIcon: SizedBox(
                              height: 1,
                              width: 1,
                              child: FittedBox(
                                child: SvgPicture.asset(
                                  'assets/images/ic_password.svg',
                                  width: 1,
                                  height: 1,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                            filled: true,
                            suffixIcon: SizedBox(
                              height: 1,
                              width: 1,
                              child: FittedBox(
                                child: SvgPicture.asset(
                                  'assets/images/ic_eye_active.svg',
                                  width: 1,
                                  height: 1,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                            hintText: 'Mật khẩu',
                            contentPadding:
                                const EdgeInsets.only(left: 40, top: 5),
                            fillColor: const Color(0xFF9086A9),
                            hintStyle: const TextStyle(color: Colors.black38),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(),
                            )),
                        controller:
                            context.read<LoginCubit>().passwordController,
                      ),
                    ),
                    BlocBuilder<LoginCubit, LoginState>(
                        builder: (context, state) {
                      return Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 15),
                        child: Text(
                          state.message ?? '',
                          style: const TextStyle(
                              color: Color(0xFFC48066), fontFamily: 'roboto'),
                          textAlign: TextAlign.center,
                        ),
                      );
                    }),
                    const SizedBox(height: 35),
                    GestureDetector(
                      onTap: () {
                        context.read<LoginCubit>().login(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(horizontal: 32),
                        height: 55,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color(0xFF7B35BA),
                            borderRadius: BorderRadius.circular(12)),
                        child: const Text('Đăng nhập',
                            style: TextStyle(
                                color: Color(0xFFC48066),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'roboto')),
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
                            color: const Color(0xFFDBC6EF),
                            borderRadius: BorderRadius.circular(12)),
                        child: const Text('Mở tài khoản online',
                            style: TextStyle(
                                color: Color(0xFF7B35BA),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'roboto')),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Image.asset('assets/images/ic_etoken_kyc.webp',width: 30,height: 30,),
                        const Text(
                          'Smart OTP từ\neToken+',
                          style: TextStyle(
                            fontFamily: 'roboto',
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        SvgPicture.asset(
                          'assets/images/ic_qr_login_30dp.svg',
                          height: 30,
                          width: 30,
                        ),
                        const Text(
                          'QR Pay',
                          style: TextStyle(fontFamily: 'roboto'),
                        )
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/ic_location_login_30dp.svg',
                            height: 30,
                            width: 30,
                          ),
                          const Text('Điểm GD',
                              style: TextStyle(fontFamily: 'roboto'))
                        ],
                      ),
                      Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/ic_exchange_login_30dp.svg',
                            height: 30,
                            width: 30,
                          ),
                          const Text('Tỷ giá',
                              style: TextStyle(fontFamily: 'roboto'))
                        ],
                      ),
                      Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/ic_help_center_login.svg',
                            height: 30,
                            width: 30,
                          ),
                          const Text(
                            'Trung tâm\ntrợ giúp',
                            style: TextStyle(fontFamily: 'roboto'),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/commonsdk_ic_cake_new.svg',
                            height: 30,
                            width: 30,
                          ),
                          const Text(
                            'Đăng nhập\nTK Con yêu',
                            style: TextStyle(fontFamily: 'roboto'),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
