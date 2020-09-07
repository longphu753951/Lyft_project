import 'package:app_dat_xe/src/app.dart';
import 'package:app_dat_xe/src/blocs/login_bloc.dart';
import 'package:app_dat_xe/src/resource/dialog/msg_dialog.dart';
import 'package:app_dat_xe/src/resource/home_page.dart';
import 'package:app_dat_xe/src/resource/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'dialog/loading_dialog.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage>{
  LoginBloc bloc = new LoginBloc();
  bool _showPass = true;
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Container(
       padding: EdgeInsets.fromLTRB(30, 50, 30, 0),
       constraints: BoxConstraints.expand(),
       color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Container(
                  width: 130,
                  height: 130,
                  child: Image.asset('assets/lyft_logo.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Text(
                  "Hello\nWelcome back \u2764",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: StreamBuilder(
                  stream: bloc.emailStream,
                  builder:(context, snapshot) => TextField(
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      controller: _emailController,
                      decoration: InputDecoration(
                          labelText: "USERNAME",
                          errorText: snapshot.hasError? snapshot.error : null,
                          labelStyle:
                          TextStyle(
                              color: Color(0xff888888),fontSize: 15),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.pink)),
                        ),
                    )
                  ,)
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: <Widget>[
                    StreamBuilder( stream: bloc.passStream,
                        builder:(context, snapshot) =>
                        TextField(
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          obscureText: _showPass,
                          controller: _passController,
                          decoration:
                          InputDecoration(
                            labelText: "PASSWORD",
                            errorText: snapshot.hasError ? snapshot.error : null,
                            labelStyle: TextStyle(color: Color(0xff888888),fontSize: 15),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.pink)),
                          ),
                        )
                    ),
                    GestureDetector(
                      onTap: onToggleShowPassword,
                      child: Text(
                        _showPass?"SHOW":"HIDE",
                        style: TextStyle(
                          color: Colors.pink,
                          fontSize: 13,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                  ]
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 40),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.pink,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    onPressed: onSignInClicked,
                    child: Text("SIGN IN",style: TextStyle(color: Colors.white),),
                  ),
                ),
              ),
              Container(
                height:50,
                width: double.infinity,
                child: Row(
                  children:<Widget>[

                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: Text(
                        "NEW USER ?",
                            style:TextStyle(fontSize: 15, color: Color(0xff888888))
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>RegisterPage())
                        );
                      },
                      child: new Text("SIGN UP",
                          style:TextStyle(fontSize: 15, color:Colors.pinkAccent)),
                    ),
                  ]
                )
              )
            ],
          ),
        ),
       ),
   );
  }


  void onSignInClicked() {
    if(bloc.IsValidInfo(_emailController.text, _passController.text)){
      var loginBloc = MyApp.of(context).loginBloc;
      LoadingDialog.showLoadingDialog(context, "Loading ....");
      loginBloc.signIn(_emailController.text,  _passController.text, (){
        LoadingDialog.hideLoadingDialog(context);
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=>HomePage())
        );
      }, (msg){
        LoadingDialog.hideLoadingDialog(context);
        MsgDialog.showMsgDialog(context, "Sign-In", msg);
      });
    }
  }

  void onToggleShowPassword() {
      setState(() {
        _showPass = !_showPass;
      });
  }


}