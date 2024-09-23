import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
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
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/qr_code.jpg',
                          width: 40,
                          height: 40,
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Xin chào',
                                  style: TextStyle(color: Color(0xFFC48066)),
                                ),
                                Text(
                                  SharedManager.instance.getUserName(),
                                  style: const TextStyle(
                                      color: Color(0xFFC48066),
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  'Chúc bạn một ngày mới tốt lành',
                                  style: TextStyle(color: Color(0xFFC48066)),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 100),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: TextFormField(
                      style: const TextStyle(
                          color: Colors.white70, fontFamily: 'roboto'),
                      obscureText: true,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.white,
                            size: 20,
                          ),
                          filled: true,
                          suffixIcon: Icon(
                            Icons.remove_red_eye,
                            color: Color(0xFFC48066),
                          ),
                          hintText: 'Mật khẩu',
                          contentPadding: EdgeInsets.only(left: 40, top: 5),
                          fillColor: Color(0xFF9086A9),
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(),
                          )),
                      controller:
                          context.read<LoginSuccessCubit>().passwordController,
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
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/ic_etoken_kyc.webp',width: 30,height: 30,),

                          const Text('Smart OTP từ\neToken+',
                              style: TextStyle(fontFamily: 'roboto'),textAlign: TextAlign.center,)
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/images/ic_chatpay_login.svg',
                            height: 30,
                            width: 30,
                          ),
                          const Text('Tỷ giá',
                              style: TextStyle(fontFamily: 'roboto'))
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/images/ic_qr_login_30dp.svg',
                            height: 30,
                            width: 30,
                          ),
                          const Text(
                            'QR Pay',
                            style: TextStyle(fontFamily: 'roboto'),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/images/ic_notify_balance_login.svg',
                            height: 30,
                            width: 30,
                          ),
                          const Text(
                            'Thông báo\nsố dư/Cảnh\nbáo',
                            style: TextStyle(fontFamily: 'roboto'),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  /*-------------*/
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
                              'Mời bạn &\nngười thân',
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
        ));
  }
}
