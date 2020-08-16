import 'package:flutter/material.dart';
import 'package:app_dat_xe/resource/src/login_page.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home:LoginPage(),
    );
  }
}