import 'package:flutter/material.dart';

class TextLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text("Chalo",style: TextStyle(color: Colors.white,fontFamily: "Montserrat",fontWeight: FontWeight.w200,fontSize: 50)),
        Text("Bhai",style: TextStyle(color: Colors.white,fontFamily: "Montserrat",fontWeight: FontWeight.w400,fontSize: 25,letterSpacing: 12)),
      ],
    );
  }
}
