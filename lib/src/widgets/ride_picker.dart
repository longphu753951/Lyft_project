import 'package:app_dat_xe/src/model/place_item_res.dart';
import 'package:app_dat_xe/src/resource/ride_picker_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RidePicker extends StatefulWidget{
  final Function(PlaceItemRes, bool) onSelected;
  RidePicker(this.onSelected);

  @override
  _RidePickerState createState() => _RidePickerState();
}

class _RidePickerState extends State<RidePicker>{
  PlaceItemRes fromAddress;
  PlaceItemRes toAddress;

  @override
  Widget build(BuildContext context) {
   return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Color(0x88999999),
            offset: Offset(0,5),
            blurRadius: 5.0,
          ),
        ]),
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 50,
            child: FlatButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RidePickerPage(
                        fromAddress == null ? "" : fromAddress.name,
                            (place, isFrom) {
                          widget.onSelected(place, isFrom);
                          fromAddress = place;
                          setState(() {});
                        }, true)));
              },
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: <Widget>[
                    SizedBox(
                      width:40,
                      height: 50,
                      child: Center(
                        child: Container(
                            width: 20,
                            height: 20,
                            alignment: Alignment.center,
                            child: Image.asset('assets/location.png',fit: BoxFit.contain,)
                        ),
                      ),
                    ),
                    Positioned(
                      right: 40,
                      top: 0,
                      width: 40,
                      height: 50,
                      child: Center(
                        child: Image.asset('assets/remove.x.png'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 50),
                      child: Text(
                        fromAddress == null ? "From" : fromAddress.name,
                        overflow: TextOverflow.ellipsis,
                        style:
                        TextStyle(fontSize: 16, color: Color(0xff323643)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            child: FlatButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        RidePickerPage(toAddress == null ? "" : toAddress.name,
                                (place, isFrom) {
                              widget.onSelected(place, isFrom);
                              toAddress = place;
                              setState(() {});
                            }, false)));
              },
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: <Widget>[
                    SizedBox(
                      width:40,
                      height: 50,
                      child: Center(
                        child: Container(
                            width: 20,
                            height: 20,
                            alignment: Alignment.center,
                            child: Image.asset('assets/gps.png',fit:BoxFit.contain,)
                        ),
                      ),
                    ),
                    Positioned(
                      right: 40,
                      top: 0,
                      width: 40,
                      height: 50,
                      child: Center(
                        child: Image.asset('assets/remove.x.png'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 50),
                      child: Text(
                        toAddress == null ? "To" : toAddress.name,
                        overflow: TextOverflow.ellipsis,
                        style:
                        TextStyle(fontSize: 16, color: Color(0xff323643)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
   );
  }

}

