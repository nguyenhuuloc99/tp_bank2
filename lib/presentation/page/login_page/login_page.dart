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
  bool _passwordVisible = false;

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
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/tpb_logo.png',
                        width: 150,
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xFFf4f2f7).withOpacity(0.8)),
                        child: Row(
                          children: [
                            const Text('VI',style: TextStyle(fontFamily: 'roboto'),),
                            const SizedBox(width: 4),
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset('assets/images/vn_square.png',
                                    width: 20, height: 20),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Text('TPBank xin chào Bạn!'),
                ),
                Center(
                  child: Text(
                      '${String.fromCharCode(0x1F49C)} ${String.fromCharCode(0x1F9E1)} ${String.fromCharCode(0x1F49C)}'),
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        enableInteractiveSelection: false,
                        cursorColor: const Color(0xFFC48066),
                        style: const TextStyle(
                            color: Colors.white70, fontFamily: 'roboto'),
                        decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: SvgPicture.asset(
                                'assets/images/ic_account.svg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            filled: true,
                            hintText: 'Tên đăng nhập',
                            contentPadding: const EdgeInsets.only(top: 5),
                            fillColor: const Color(0xFF9086A9),
                            hintStyle: const TextStyle(color: Colors.white70),
                            prefixIconConstraints: const BoxConstraints(
                                minWidth: 25, minHeight: 25),
                            suffixIconConstraints: const BoxConstraints(
                                minWidth: 30, minHeight: 25),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: SvgPicture.asset(
                                'assets/images/ic_info.svg',
                                fit: BoxFit.cover,
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
                        cursorColor: const Color(0xFFC48066),
                        enableInteractiveSelection: false,
                        style: const TextStyle(
                            color: Colors.white70, fontFamily: 'roboto'),
                        obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                            prefixIconConstraints: const BoxConstraints(
                                minWidth: 25, minHeight: 25),
                            suffixIconConstraints: const BoxConstraints(
                                minWidth: 25, minHeight: 25),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: SvgPicture.asset(
                                'assets/images/ic_password.svg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            filled: true,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: SvgPicture.asset(
                                  _passwordVisible ? 'assets/images/ic_eye_inactive_off.svg' : 'assets/images/ic_eye_active.svg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            hintText: 'Mật khẩu',
                            contentPadding:
                                const EdgeInsets.only(left: 40, top: 5),
                            fillColor: const Color(0xFF9086A9),
                            hintStyle: const TextStyle(color: Colors.white70),
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
                      return Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 15),
                          alignment: Alignment.center,
                          child: Text(
                            state.message ?? '',
                            style: const TextStyle(
                                color: Color(0xFFC48066), fontFamily: 'roboto'),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }),
                    const SizedBox(height: 20),
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
                            borderRadius: BorderRadius.circular(30)),
                        child: const Text('Đăng nhập',
                            style: TextStyle(
                                color: Color(0xFFC48066),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'roboto')),
                      ),
                    ),
                    const SizedBox(height: 28),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 32),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(16),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color(0xFFDBC6EF),
                            borderRadius: BorderRadius.circular(30)),
                        child: const Text('Mở tài khoản online',
                            style: TextStyle(
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
                    _contentApp('assets/images/ic_etoken_kyc.webp',
                        'Smart OTP từ\neToken+'),
                    _contentApp('assets/images/ic_qr_login_30dp.svg', 'QR Pay'),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _contentAppBottom(
                          'assets/images/ic_location_login_30dp.svg',
                          'Điểm GD'),
                      _contentAppBottom(
                          'assets/images/ic_exchange_login_30dp.svg', 'Tỷ giá'),
                      _contentAppBottom(
                          'assets/images/ic_help_center_login.svg',
                          'Trung tâm\ntrợ giúp'),
                      _contentAppBottom(
                          'assets/images/commonsdk_ic_cake_new.svg',
                          'Đăng nhập\nTK Con yêu'),
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

  Widget _contentApp(String asset, String content) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFFf4f2f7).withOpacity(0.5)),
          child: asset.contains('svg')
              ? SvgPicture.asset(
                  asset,
                  height: 30,
                  width: 30,
                )
              : Image.asset(
                  asset,
                  width: 30,
                  height: 30,
                ),
        ),
        Text(
          content,
          style: const TextStyle(
            fontFamily: 'roboto',
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Widget _contentAppBottom(String asset, String content) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(
          asset,
          height: 30,
          width: 30,
        ),
        Text(content, style: TextStyle(fontFamily: 'roboto'))
      ],
    );
  }
}
