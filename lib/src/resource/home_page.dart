import 'package:app_dat_xe/src/widgets/home_menu.dart';
import 'package:app_dat_xe/src/widgets/ride_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     key: _scaffoldKey,
     body: Container(
       constraints: BoxConstraints.expand(),
       color: Colors.white,
       child: Stack(
         children: <Widget>[
           GoogleMap(
             initialCameraPosition: CameraPosition(
               target: LatLng(10.7915178, 106.72714422),
               zoom: 14.4746
             ),
             zoomControlsEnabled: false,
           ),
           Positioned(
             left: 0,
             top: 0,
             right: 0,
             child: Column(
               children: <Widget>[
                 AppBar(
                   backgroundColor: Colors.transparent,
                   elevation: 0.0,
                   title: Center(
                     child:Container(
                         width: 50,
                         height: 30,
                         alignment: Alignment.center,
                         child: Image.asset("assets/lyft_logo.png",fit:BoxFit.contain,)
                     ),
                   ),
                   leading: FlatButton(
                     onPressed: (){
                        print("click menu");
                        _scaffoldKey.currentState.openDrawer();
                     },
                     child: Container(
                         width: 24,
                         height: 24,
                         alignment: Alignment.center,
                         child: Image.asset("assets/menu.png",fit:BoxFit.contain,)
                     ),
                   ),
                   actions: <Widget>[Image.asset("assets/notify.png")],
                 ),
                 Padding(
                   padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                   child: RidePicker(),
                 ),
               ],
             ),
           )
         ],
       ),
     ),
     drawer: Container(
       width: 250,
       child: Drawer(
         child: HomeMenu(),
       ),
     ),
   );
  }


}