import 'package:flutter/material.dart';

import '../../../utils/shared.dart';

class LoginSuccess2 extends StatelessWidget {
  const LoginSuccess2({super.key});

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
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
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
                    height: 80,
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
                  )
                ],
              ),
            )),
      ),
    );
  }
}
