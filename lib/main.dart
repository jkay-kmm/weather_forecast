import 'package:flutter/material.dart';
import 'package:weatherforecast/views/hone_screen.dart';
import 'package:weatherforecast/views/splash_screen.dart';

import 'core/service/navigation.service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigationService.navigatorKey, // Sử dụng navigation service
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
      },
    );
  }
}
