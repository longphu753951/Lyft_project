import 'package:app_dat_xe/src/model/place_item_res.dart';
import 'package:app_dat_xe/src/model/step_res.dart';
import 'package:app_dat_xe/src/responsitory/place_service.dart';
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
  var _tripDistance = 0;
  final Map<String, Marker> _markers = <String, Marker>{};

  GoogleMapController _mapController;

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
                   child: RidePicker(onPlaceSelected),
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



  onPlaceSelected(PlaceItemRes place, bool p2) {
    String mkId = p2 ? "from_address" : "to_address";
    _addMarker(mkId, place);
  }

  void _addMarker(String mkId, PlaceItemRes place) async {
    // remove old
    _markers.remove(mkId);
    _mapController.clearMarkers();

    _markers[mkId] = Marker(
        mkId,
        MarkerOptions(
            position: LatLng(place.lat, place.lng),
            infoWindowText: InfoWindowText(place.name, place.address)));

    for (var m in _markers.values) {
      await _mapController.addMarker(m.options);
    }
  }
  void _moveCamera() {
    print("move camera: ");
    print(_markers);

    if (_markers.values.length > 1) {
      var fromLatLng = _markers["from_address"].options.position;
      var toLatLng = _markers["to_address"].options.position;

      var sLat, sLng, nLat, nLng;
      if(fromLatLng.latitude <= toLatLng.latitude) {
        sLat = fromLatLng.latitude;
        nLat = toLatLng.latitude;
      } else {
        sLat = toLatLng.latitude;
        nLat = fromLatLng.latitude;
      }

      if(fromLatLng.longitude <= toLatLng.longitude) {
        sLng = fromLatLng.longitude;
        nLng = toLatLng.longitude;
      } else {
        sLng = toLatLng.longitude;
        nLng = fromLatLng.longitude;
      }

      LatLngBounds bounds = LatLngBounds(northeast: LatLng(nLat, nLng), southwest: LatLng(sLat, sLng));
      _mapController.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
    } else {
      _mapController.animateCamera(CameraUpdate.newLatLng(
          _markers.values.elementAt(0).options.position));
    }
  }
  void _checkDrawPolyline() {
    _mapController.clearPolylines();

    if(_markers.length > 1){
      var from = _markers["from_address"].options.position;
      var to = _markers["to_address"].options.position;
      PlaceService.getStep(from.latitude,from.longitude,to.latitude,to.longitude)
      .then((vl) {
        List<StepsRes> rs = vl;
        List<LatLng> paths = new List();
        for(var t in rs){
          paths
              .add(LatLng(
            t.startLocation.latitude,t.startLocation.longitude
          ));
          paths
              .add(LatLng(
              t.endLocation.latitude,t.endLocation.longitude
          ));
        }
        print(paths);
        _mapController.addPolyline(PolylineOptions(
          points: paths,color: Colors.pink.value,width: 4
        ));
      });
  }
  }
}