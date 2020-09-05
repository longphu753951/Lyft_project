import 'package:app_dat_xe/src/resource/register_page.dart';
import 'package:flutter/material.dart';
import 'package:app_dat_xe/src/resource//login_page.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home:RegisterPage(),
    );

  }
}