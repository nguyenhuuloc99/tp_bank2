import 'package:flutter/material.dart';

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
          child: const SizedBox(),
        ),
      ),
    );
  }
}
