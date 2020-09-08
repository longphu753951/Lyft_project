import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RidePicker extends StatefulWidget{
  @override
  _RidePickerState createState() => _RidePickerState();
}

class _RidePickerState extends State<RidePicker>{
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
              onPressed: (){},
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
                      padding: EdgeInsets.fromLTRB(40, 0, 50, 0),
                      child: Text('49, Đưỡng số 8, khu phố 4, Bình An, Q2, HCM',
                      overflow: TextOverflow.ellipsis,
                      style:
                        TextStyle(fontSize: 16,
                            color: Color(0xff323643)
                        ),
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
              onPressed: (){},
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
                      padding: EdgeInsets.fromLTRB(40, 0, 50, 0),
                      child: Text('Đại học Mở HCM Cơ Sở Nguyễn Kiệm',
                        overflow: TextOverflow.ellipsis,
                        style:
                        TextStyle(fontSize: 16,
                            color: Color(0xff323643)
                        ),
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

