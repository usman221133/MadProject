import 'dart:async';

import 'package:carpool/base/Utils.dart';
import 'package:carpool/states/HomeMapState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ScopedModel<HomeMapState>(
      model: new HomeMapState(),
      child: new Scaffold(
        body: _HomeMapView(),
      ),
    );
  }
}

class _HomeMapView extends StatefulWidget {
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  __HomeMapViewState createState() => __HomeMapViewState();
}

class __HomeMapViewState extends State<_HomeMapView> {
  final Completer<GoogleMapController> _controller = Completer();

  bool isDown;
  bool isUp;

  double animTop;
  double animBottom;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final isLoading =
        ScopedModel.of<HomeMapState>(context, rebuildOnChange: true).isLoading;
    setTimeout((timer) {
      timer.cancel();
      HomeMapState.of(context).stopLoading();
    }, 1000);
    return isLoading ? renderLoading() : renderMap();
  }
Size getScreenSize(BuildContext context) => MediaQuery.of(context).size;

  @override
  void initState() {
   isDown = false;
    animTop = 0;
   isUp = false;
    animBottom = 0;
    super.initState();
  }



  expand(){
    setState(() {
      animTop = 50;
     animBottom =50;
    });
  }

  collapse(){
    setState(() {
      animTop = 0;
      animBottom = 0;

    });
  }

  trigger(){
    setState(() {
      isDown = !isDown;
      if(isDown){
        expand();
      }else{
       collapse();
      }
//      isUp= !isDown;
//      if(isUp){
//        collapse();
//      }else{
//        expand();
//      }
    });
  }


  Widget renderMap() {
    return Stack(children: <Widget>[
      GoogleMap(
        myLocationEnabled: true,
        initialCameraPosition: _HomeMapView._kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      Column(
//        crossAxisAlignment: CrossAxisAlignment.center,
//        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: Container(

              margin: const EdgeInsets.only(left: 30, top: 50, right: 20),
              padding: EdgeInsets.only(top: 0, right: 0, left: 0),
              child: Stack(
                //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //    crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  AnimatedPositioned(
                    duration: Duration(milliseconds: 1000),
                    top: animTop,
                    child: topBottomItem(),
                  ),
                  topUpperItem(),
                ],
              ),
              decoration: new BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(6),
//            boxShadow: [
//              BoxShadow(
//                color: Colors.blueGrey,
//                offset: Offset(1.0, 1.0),
//              ),
//            ]
              ),
              width: 350,
              height: 110,
            ),



          ),
          Container(
            //margin: const EdgeInsets.only(left: 30, top: 500, right: 20),
            //padding: EdgeInsets.only(right: 0, left: 0, bottom: 0, top: 0),
            //padding: EdgeInsets.symmetric(horizontal: 10,vertical: 0),
            child: Stack(

              children: <Widget>[
                AnimatedPositioned(
                  duration: Duration(milliseconds: 1000),
                  bottom: animTop,
                  child:lowerBottomItem(),
                ),
                lowerUpperItems()
              ],
            ),


            decoration: new BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(6),
//            boxShadow: [
//              BoxShadow(
//                color: Colors.blueGrey,
//                offset: Offset(1.0, 1.0),
//              ),
//            ]
            ),
          //  width: 350,
            height: 100,
            width: MediaQuery.of(context).size.width/0,
            //color: Colors.white,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.start,
//            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                // alignment: AlignmentDirectional.bottomCenter,
                margin: EdgeInsets.only(bottom: 10,left: 22),
//                width: 260,
                width: getScreenSize(context).width -90 ,
                height: 60,
                padding: EdgeInsets.only(top: 10),
//
//            color: Colors.white,
//          ),
//        ),
                child: RaisedButton(
                    padding: EdgeInsets.only(),
                    child: Text(
                      "Confirm Pickup",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.green,
                    onPressed:trigger),
              ),
              Container(
                 margin: const EdgeInsets.only( left:5,right: 20,top: 10),
                child: Icon(
                  Icons.calendar_today,
                  color: Colors.green,
                ),
             width: 40,

                height: 50,
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(color: Colors.blueGrey, offset: Offset(1.0, 1.0))
                    ]),
              )
            ],
          ),


        ],
      ),
//      Container(
//
//        margin: const EdgeInsets.only(left: 30, top: 40, right: 20),
//        padding: EdgeInsets.only(top: 0, right: 0, left: 0),
//        child: Stack(
//          //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//          //    crossAxisAlignment: CrossAxisAlignment.center,
//          children: <Widget>[
//
//           AnimatedPositioned(
//             duration: Duration(milliseconds: 1000),
//             top: animTop,
//             child: topBottomItem(),
//           ),
//            topUpperItem(),
//          ],
//        ),
//        decoration: new BoxDecoration(
//            color: Colors.transparent,
//            borderRadius: BorderRadius.circular(6),
////            boxShadow: [
////              BoxShadow(
////                color: Colors.blueGrey,
////                offset: Offset(1.0, 1.0),
////              ),
////            ]
//        ),
//        width: 350,
//        height: 110,
//      ),

//      Container(
//
//        //margin: const EdgeInsets.only(left: 30, top: 500, right: 20),
//        //padding: EdgeInsets.only(right: 0, left: 0, bottom: 0, top: 0),
//        //padding: EdgeInsets.symmetric(horizontal: 10,vertical: 0),
//        child: Stack(
//
//          children: <Widget>[
//            AnimatedPositioned(
//              duration: Duration(milliseconds: 1000),
//            bottom: animTop,
//              child:lowerBottomItem(),
//            ),
//            lowerUpperItems()
//          ],
//        ),
//
//
//        decoration: new BoxDecoration(
//            color: Colors.transparent,
//            borderRadius: BorderRadius.circular(6),
////            boxShadow: [
////              BoxShadow(
////                color: Colors.blueGrey,
////                offset: Offset(1.0, 1.0),
////              ),
////            ]
//        ),
//        width: 350,
//        height: 100,
//        //color: Colors.white,
//      ),
//      Container(
//       // alignment: AlignmentDirectional.bottomCenter,
//
//        width: 300,
//        height: 50,
//         padding: EdgeInsets.only(top: 15),
////
////            color: Colors.white,
////          ),
////        ),
//        child: RaisedButton(
//            padding: EdgeInsets.only(),
//            child: Text(
//              "Confirm Pickup",
//              style: TextStyle(color: Colors.white),
//            ),
//            color: Colors.green,
//            onPressed:trigger),
//      ),
//      Container(
//      margin: const EdgeInsets.only(left: 340, top: 610, right: 10),
//        child: Icon(
//          Icons.calendar_today,
//          color: Colors.green,
//        ),
//        width: 40,
//        height: 50,
//        decoration: new BoxDecoration(
//            color: Colors.white,
//            borderRadius: BorderRadius.circular(6),
//            boxShadow: [
//              BoxShadow(color: Colors.blueGrey, offset: Offset(1.0, 1.0))
//            ]),
//      )
    ]);
  }

  Widget renderLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  topUpperItem(){
    return  Container(
      child: Row(
        children: <Widget>[
          Padding(
            child: Row(
              children: <Widget>[
                Container(
                  // margin: const EdgeInsets.only( right: 10,left: 0, bottom: 70),
                  decoration: new BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green,
                      )
                    ],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.green, width: 2),
                    color: Colors.white,
                  ),

                  width: 13,
                  height: 13,
                ),
              ],
            ),
            padding: EdgeInsets.only(left: 25),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 13, left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "ssuet",
                    style: TextStyle(fontSize: 13),
                  ),
                  Text(
                    "sir syed stop Karachi",
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      width: 350,
      height: 55,
    );
  }

//  cont(BuildContext context, double bottom, Color color) {
//    return AnimatedPositioned(
//      duration: Duration(milliseconds: 1000),
//      bottom: bottom,
//    );
//  }

  topBottomItem() {
    return  Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 0,right: 45),
            child: Row(
              children: <Widget>[
                Container(
                  //margin: const EdgeInsets.only( right: 10,left:0, bottom: 30, top: 60),
                  //padding: EdgeInsets.only(right: 30, left: 30),
                  decoration: new BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green,
                      )
                    ],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.green, width: 2),
                    color: Colors.green,
                  ),

                  width: 13,
                  height: 13,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15, left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Pakacademy -B1, COM-1",
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        "B1, Com!, Works Cooperative Housing Society",
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),

//
              ],
            ),
          )
        ],
      ),
      decoration: new BoxDecoration(
        // borderRadius: BorderRadius.circular(6),
          color: Colors.white,
          border: Border(
              top: BorderSide(
                width: 1,
                color: Colors.grey,
              ))),
      width: 350,
      height: 55,
      //color: Colors.blue,
    );
  }
  lowerBottomItem(){
    return Container(

      margin:
      const EdgeInsets.only(top: 0, bottom: 0, left:25, right: 10),
      padding: EdgeInsets.only(left: 5, right: 0, bottom: 0, top: 0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Padding(
            child: Image.asset(
              "images/cash.png",
              width: 22,
              height: 22,
              alignment: Alignment.centerLeft,
            ),
            padding: EdgeInsets.only(left: 15, top: 12),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 30, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Cash",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "PKR 20 credit Remaining",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 0, right: 0, bottom: 0, top: 0),
            padding: EdgeInsets.only(top: 15, right: 8, left: 15),
            child: Text(
              "+ PROMO",
              style: TextStyle(fontSize: 12),
            ),
            decoration: new BoxDecoration(
              color: Colors.white,
              //borderRadius: BorderRadius.only(bottomRight: Radius.circular(6)),

              border: Border(
                left: BorderSide(
                  width: 1,
                  color: Colors.grey,
                ),

              ),
//
//
//
            ),

         //  width: 100,
            height: 200,
          ),
        ],
      ),
      decoration: new BoxDecoration(
        // borderRadius: BorderRadius.circular(6),
          color: Colors.white,
          border: Border(
              bottom: BorderSide(
                width: 1,
                color: Colors.grey,
              ))),
    // width: 350,
      width: getScreenSize(context).width -50,
      height: 50,
    );
  }

  lowerUpperItems(){
    return Container(
      child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(

            margin: const EdgeInsets.only(top: 50, bottom: 0, left: 25, right: 0),
            padding: EdgeInsets.only(left: 5, right: 25, top: 15),
            child: Row(
              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  child: Image.asset(
                    "images/Car.png",
                    alignment: Alignment.centerLeft,
                  ),
                  padding: EdgeInsets.only(bottom: 8, left: 5),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 28, top: 3,bottom: 7),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        "GO+",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 170),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "7 mins",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              color: Colors.white,
            ),

      //      width: 350,
            height: 50,
            width: getScreenSize(context).width -50,

          )

  ]

    )
    );

  }

}

