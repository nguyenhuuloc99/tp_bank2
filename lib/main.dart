import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tp_bank/router/router.dart';
import 'package:tp_bank/service/api_config/api_config.dart';
import 'package:tp_bank/utils/shared.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ApiConfig();
  await SharedManager.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xFF7B35BB), // navigation bar color
    statusBarColor: Color(0xFF7B35BB), // status bar color
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
