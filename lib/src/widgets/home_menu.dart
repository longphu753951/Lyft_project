import 'package:flutter/material.dart';

class HomeMenu extends StatefulWidget {
  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Container(
              width: 31,
              height: 31,
              alignment: Alignment.center,
              child: Image.asset("assets/user.png",fit:BoxFit.contain,)),
          title: Text(
            "My Profile",
            style: TextStyle(fontSize: 18,  color: Color(0xff323643)),
          ),
        ),
        ListTile(
          leading: Container(
              width: 31,
              height: 31,
              alignment: Alignment.center,
              child: Image.asset("assets/history.png",fit:BoxFit.contain,)),
          title: Text(
            "Ride History",
            style: TextStyle(fontSize: 18, color:  Color(0xff323643)),
          ),
        ),
        ListTile(
          leading: Container(
              width: 31,
              height: 31,
              alignment: Alignment.center,
              child: Image.asset("assets/discount.png",fit:BoxFit.contain,)),
          title: Text(
            "Offers",
            style: TextStyle(fontSize: 18, color: Color(0xff323643)),
          ),
        ),
        ListTile(
          leading: Container(
              width: 31,
              height: 31,
              alignment: Alignment.center,
              child: Image.asset("assets/support.png",fit:BoxFit.contain,)),
          title: Text(
            "Help & Supports",
            style: TextStyle(fontSize: 18,  color: Color(0xff323643)),
          ),
        ),
        ListTile(
          leading: Container(
              width: 31,
              height: 31,
              alignment: Alignment.center,
              child: Image.asset("assets/log_out.png",fit:BoxFit.contain,)),
          title: Text(
            "Logout",
            style: TextStyle(fontSize: 18, color: Color(0xff323643)),
          ),
        )
      ],
    );
  }
}