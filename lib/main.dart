import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seoul_subway_info_app/routes.dart';
import 'package:seoul_subway_info_app/ui/main_screen.dart';
import 'package:seoul_subway_info_app/ui/main_view_model.dart';

import 'di/di_setup.dart';

void main() {
  diSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
