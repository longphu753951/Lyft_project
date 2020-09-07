import 'package:app_dat_xe/src/blocs/login_bloc.dart';
import 'package:app_dat_xe/src/resource/register_page.dart';
import 'package:flutter/material.dart';
import 'package:app_dat_xe/src/resource//login_page.dart';

class MyApp extends InheritedWidget{
  final LoginBloc loginBloc;
  final Widget child;
  MyApp(this.loginBloc, this.child): super(child: child);


  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
  static MyApp of(BuildContext context){
    return context.inheritFromWidgetOfExactType(MyApp);
  }
}