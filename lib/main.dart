import 'package:flutter/material.dart';
import 'package:tp_bank/router/router.dart';
import 'package:tp_bank/service/api_config/api_config.dart';

void main() async {
  ApiConfig();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
