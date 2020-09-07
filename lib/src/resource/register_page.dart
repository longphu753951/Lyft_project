import 'package:app_dat_xe/src/blocs/signup_bloc.dart';
import 'package:app_dat_xe/src/resource/dialog/loading_dialog.dart';
import 'package:app_dat_xe/src/resource/dialog/msg_dialog.dart';
import 'package:app_dat_xe/src/resource/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class RegisterPage extends StatefulWidget{
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  SignUpBloc bloc = new SignUpBloc();
  bool _showPass = true;
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.pink),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Container(
                  width: 130,
                  height: 130,
                  child:ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/lyft_logo_register.png',
                      fit: BoxFit.fill,
                    ),
                  ),

                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                  "Welcome Abroad!",
                    style: TextStyle(fontSize: 22, color: Color(0xff333333)),
                ),
              ),
              Text(
                "Sign up with Lyft in simple steps",
                style: TextStyle(fontSize: 16, color: Color(0xff333333)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,15,0,15),
                child:
                  StreamBuilder(
                    stream: bloc.userStream,
                    builder:(context, snapshot)=>TextFormField(
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                      controller: _userController,
                      decoration: new InputDecoration(
                        labelText: "User name",
                        errorText: snapshot.hasError? snapshot.error : null,
                        labelStyle: TextStyle(
                          color:Colors.black54,
                        ),
                        prefixIcon: new IconButton(
                          padding: const EdgeInsetsDirectional.only(start: 12.0),
                          icon: Image.asset(
                            'assets/account.png',width: 25.0,
                            height: 25.0,
                          ),
                          onPressed: null,
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.pink,width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(6))
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.pink,width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(6))
                        ),
                      ),
                    ),
                  )
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,0,15),
                child: StreamBuilder(
                  stream: bloc.emailStream,
                  builder: (context,snapshot)=>TextField(
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                    controller: _emailController,
                    decoration: InputDecoration(
                        labelText: "Email",
                        errorText: snapshot.hasError? snapshot.error : null,
                        labelStyle: TextStyle(
                          color:Colors.black54,
                        ),
                        prefixIcon: new IconButton(
                          icon: Image.asset(
                            'assets/email.png',width: 25.0,
                            height: 25.0,
                          ),
                          onPressed: null,
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.black54,width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(6))
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.pink,width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(6))
                        )
                    ),
                  ),
                )
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,0,15),
                child:
                StreamBuilder(
                  stream: bloc.telephoneStream,
                  builder: (context, snapshot)=>
                      TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                        controller: _phoneController,
                        decoration: InputDecoration(
                            labelText: "Telephone",
                            errorText: snapshot.hasError? snapshot.error : null,
                            labelStyle: TextStyle(
                              color:Colors.black54,
                            ),
                            prefixIcon: new IconButton(
                              padding: const EdgeInsetsDirectional.only(start: 12.0),
                              icon: Image.asset(
                                'assets/phone.png',width: 25.0,
                                height: 25.0,
                              ),
                              onPressed: null,
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color: Colors.black54,width: 1),
                                borderRadius: BorderRadius.all(Radius.circular(6))
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color: Colors.pink,width: 2),
                                borderRadius: BorderRadius.all(Radius.circular(6))
                            )
                        ),
                      ),
                )
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,0,20),
                child:
                StreamBuilder(
                  stream: bloc.passStream,
                  builder: (context, snapshot) =>
                      TextField(
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                        controller: _passController,
                        decoration: InputDecoration(
                            labelText: "Password",
                            errorText: snapshot.hasError? snapshot.error : null,
                            labelStyle: TextStyle(
                              color:Colors.black54,
                            ),
                            prefixIcon: new IconButton(
                              padding: const EdgeInsetsDirectional.only(start: 12.0),
                              icon: Image.asset(
                                'assets/password.png',width: 25.0,
                                height: 25.0,
                              ),
                              onPressed: null,
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color: Colors.black54,width: 1),
                                borderRadius: BorderRadius.all(Radius.circular(6))
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color: Colors.pink,width: 2),
                                borderRadius: BorderRadius.all(Radius.circular(6))
                            )
                        ),
                      ),
                )
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.pink,
                    onPressed: onSignUpPressed,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Text("SIGN UP",style: TextStyle(color: Colors.white),),
                  ),
                ),
              ),
              Padding(
                  padding:  const EdgeInsets.fromLTRB(70, 20, 70, 20),
                  child: Row(
                      children:<Widget>[
                        Text(
                              "ALREADY A USER ?",
                              style:TextStyle(fontSize: 15, color: Color(0xff888888))
                          ),

                         GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>LoginPage())
                            );
                          },
                          child: new Text("SIGN IN",
                              style:TextStyle(fontSize: 15, color:Colors.pinkAccent)),
                        ),
                      ]
                  )
              )
            ],
          ),
        )
      )
    );
  }

  void onSignUpPressed() {
    if(bloc.IsValidInfo(_userController.text,_emailController.text,_phoneController.text,_passController.text)){
     //Chạy dialog load và tạo user
      LoadingDialog.showLoadingDialog(context, "Loading ...");
      bloc.signUp(_emailController.text, _passController.text, _phoneController.text, _userController.text, (){
       LoadingDialog.hideLoadingDialog(context);
        Navigator.push(context,
           MaterialPageRoute(builder: (context)=>HomePage())
       );
     },(msg){
        LoadingDialog.hideLoadingDialog(context);
        MsgDialog.showMsgDialog(context, "", msg);
      });
    }
  }
}
