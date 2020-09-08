import 'package:app_dat_xe/src/app.dart';
import 'package:app_dat_xe/src/blocs/login_bloc.dart';
import 'package:app_dat_xe/src/resource/home_page.dart';
import 'package:app_dat_xe/src/resource/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
       WidgetsFlutterBinding.ensureInitialized();
       await Firebase.initializeApp();
  runApp(MyApp( new LoginBloc(),
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      )));
}

