import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/shared.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash>  with TickerProviderStateMixin{
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);

    _controller.addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        SharedManager.instance.getLogin() == true
            ? context.pushReplacement('/loginSuccess')
            : context.pushReplacement('/login');
      }
    });
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
          child: Lottie.asset('assets/images/mv_splash_final.json',
              onLoaded: (composition) {
                _controller
                  ..duration = composition.duration
                  ..forward();
              },
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }
}
