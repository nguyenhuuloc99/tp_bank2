import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:tp_bank/presentation/page/login_page/login_page.dart';
import 'package:tp_bank/presentation/page/login_page/login_success2.dart';
import 'package:tp_bank/utils/shared.dart';

import '../presentation/page/login_page/login_page_success.dart';
import '../presentation/page/login_page/splash.dart';

final router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Splash();
      },
      routes: <RouteBase>[
        GoRoute(
            path: 'login',
            builder: (context, state) {
              return const LoginScreen();
            }),
        GoRoute(
            path: 'loginSuccess',
            builder: (context, state) {
              return const LoginPageSuccess();
            }),
        GoRoute(
            path: 'lg2',
            builder: (context, state) {
              return const LoginSuccess2();
            }),
      ],
    ),
  ],
);
