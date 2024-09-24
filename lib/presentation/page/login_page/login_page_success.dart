import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tp_bank/presentation/cubit/login_success_cubit.dart';
import 'package:tp_bank/presentation/cubit/login_success_state_cubit.dart';

import '../../../utils/shared.dart';

class LoginPageSuccess extends StatefulWidget {
  const LoginPageSuccess({super.key});

  @override
  State<LoginPageSuccess> createState() => _LoginPageSuccessState();
}

class _LoginPageSuccessState extends State<LoginPageSuccess> {
  bool _passwordVisible = false;

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
                  image: AssetImage("assets/images/bg_app_2.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/tpb_logo.png',
                          width: 150,
                          height: 30,
                          fit: BoxFit.fitWidth,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:
                                      const Color(0xFFf4f2f7).withOpacity(0.8)),
                              child: Row(
                                children: [
                                  const Text(
                                    'VI',
                                    style: TextStyle(fontFamily: 'roboto'),
                                  ),
                                  const SizedBox(width: 4),
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                          'assets/images/vn_square.png',
                                          width: 20,
                                          height: 20),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            SvgPicture.asset(
                              'assets/images/ic_new_notice.svg',
                              height: 30,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white, width: 2)),
                              child: SvgPicture.asset(
                                'assets/images/ic_qr_login_term.svg',
                                width: 50,
                                height: 50,
                              ),
                            ),
                            const Positioned.fill(
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Lấy mã\nQR của tôi',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 10),
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Xin chào',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  SharedManager.instance.getUserName().toUpperCase(),
                                  style: const TextStyle(
                                      color: Color(0xFF2B1F51),
                                      fontWeight: FontWeight.bold),
                                ),
                                 Text(
                                    'Chúc bạn một ngày mới tốt lành ${String.fromCharCode(0x1F44F)}',
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            context.push('/login');
                          },
                          child: SvgPicture.asset(
                              width: 30,
                              height: 30,
                              'assets/images/commonsdk_ic_not_you.svg'),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 150),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      cursorColor: const Color(0xFFC48066),
                      enableInteractiveSelection: false,
                      style: const TextStyle(
                          color: Colors.white70, fontFamily: 'roboto'),
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                          prefixIconConstraints:
                              const BoxConstraints(minWidth: 25, minHeight: 25),
                          suffixIconConstraints:
                              const BoxConstraints(minWidth: 25, minHeight: 25),
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
                                _passwordVisible
                                    ? 'assets/images/ic_eye_inactive_off.svg'
                                    : 'assets/images/ic_eye_active.svg',
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
                          context.read<LoginSuccessCubit>().passwordController,
                    ),
                  ),
                  BlocBuilder<LoginSuccessCubit, LoginSuccessState>(
                      builder: (context, state) {
                    return Expanded(
                        child: Center(
                      child: Text(
                        state.message ?? '',
                        style: const TextStyle(
                          color: Color(0xFFC48066),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ));
                    return const SizedBox.shrink();
                  }),
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
                          borderRadius: BorderRadius.circular(30)),
                      child: const Text(
                        'Đăng nhập',
                        style: TextStyle(
                            color: Color(0xFFC48066),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _contentApp('assets/images/ic_etoken_kyc.webp',
                            'Smart OTP từ\neToken+',
                            opacity: 0.3),
                        _contentApp(
                            'assets/images/ic_chatpay_login.svg', 'ChatPay',
                            opacity: 0.3),
                        _contentApp(
                            'assets/images/ic_qr_login_30dp.svg', 'QR Pay',
                            opacity: 0.4),
                        _contentApp('assets/images/ic_notify_balance_login.svg',
                            'Thông báo\nsố dư/Cảnh\nbáo',
                            opacity: 0.4),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _contentApp('assets/images/ic_location_login_30dp.svg',
                            'Điểm GD',
                            opacity: 0),
                        _contentApp('assets/images/ic_exchange_login_30dp.svg',
                            'Tỷ giá',
                            opacity: 0),
                        _contentApp('assets/images/ic_help_center_login.svg',
                            'Trung tâm\ntrợ giúp',
                            opacity: 0),
                        _contentApp('assets/images/ic_noti_reminder.png',
                            'Mời bạn &\nngười thân',
                            opacity: 0),
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
        ));
  }

  Widget _contentApp(String asset, String content, {double? opacity}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFFD2BBFF).withOpacity(opacity ?? 1)),
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
}
