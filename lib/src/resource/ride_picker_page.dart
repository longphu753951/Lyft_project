import 'package:app_dat_xe/src/blocs/place_bloc.dart';
import 'package:app_dat_xe/src/model/place_item_res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RidePickerPage extends StatefulWidget{
  final String selectedAddress;
  final Function(PlaceItemRes, bool) onSelected;
  final bool _isFromAddress;
  RidePickerPage(this.selectedAddress, this.onSelected, this._isFromAddress);

  @override
  _RidePickerPageState createState() => _RidePickerPageState();

}

class _RidePickerPageState extends State<RidePickerPage> {
  var _addressController;
  var placeBloc = PlaceBloc();

  @override
  void initState(){
    _addressController = TextEditingController(text: widget.selectedAddress);
    super.initState();
  }
  @override
  void dispose() {
    placeBloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Color(0xfff8f8f8),
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top:10),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  child: Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: <Widget>[
                      SizedBox(
                        width: 40,
                        height: 60,
                        child: Center(
                          child:Container(
                              width: 20,
                              height: 20,
                              alignment: Alignment.center,
                              child: Image.asset('assets/location.png',fit: BoxFit.contain,)
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        width: 40,
                        height: 60,
                        child: Center(
                          child: FlatButton(
                            onPressed: (){
                              _addressController.text = "";
                            },
                            child: Image.asset('assets/remove_x.png'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 40,right: 50),
                        child: TextField(
                          cursorColor: Colors.pink,
                          controller: _addressController,
                          textInputAction: TextInputAction.search,
                          onSubmitted: (str){
                            placeBloc.searchPlace(str);
                          },
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.pink))
                          ),
                          style: TextStyle(fontSize: 18, color: Color(0xff323643),),
                      )
                      )
                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: StreamBuilder(
                    stream: placeBloc.placeStream,
                    builder: (context, snapshot){
                      if(snapshot.hasData) {
                        print(snapshot.data.toString());
                        if (snapshot.data == "start") {
                          return Center(
                            child: CircularProgressIndicator(
                              valueColor: new AlwaysStoppedAnimation<Color>(Colors.pink),
                            ),
                          );
                        }
                        print(snapshot.data.toString());
                        List<PlaceItemRes> places = snapshot.data;
                        return ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(places
                                    .elementAt(index)
                                    .name),
                                subtitle: Text(places
                                    .elementAt(index)
                                    .address),
                                onTap: () {
                                  print("on tap");
                                  Navigator.of(context).pop();
                                  widget.onSelected(places.elementAt(index),
                                      widget._isFromAddress);
                                },
                              );
                            },
                            separatorBuilder: (context, index) =>
                                Divider(
                                  height: 1,
                                  color: Color(0xfff5f5f5),
                                ),
                            itemCount: places.length);
                      } else{
                        return Container();
                      }
                    }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}