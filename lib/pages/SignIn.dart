import 'package:carpool/base/Utils.dart';
import 'package:carpool/widgets/TextCustom.dart';
import 'package:carpool/widgets/app_bar_large_rounded.dart';
import 'package:carpool/widgets/text_logo.dart';
import 'package:flutter/material.dart';

import 'SignInCode.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new ListView(
        children: <Widget>[
          AppBarLargeRounded(
            TextLogo()
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextCustom("Sign In",Colors.black,TextAlign.start,type: TextType.heading),
                    SizedBox(
                      height: 5,
                    ),
                    TextCustom("Get moving with Chalo Bhai!",Colors.black,TextAlign.start,type: TextType.xSmall),
                  ],
                ),
              ),
              Container(
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      labelText: "Enter your phone number e.g. +92 123456789",
                      labelStyle: TextStyle(fontSize: 14)
                  ),
                ),
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 0),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right:20,top: 15),
                child: RaisedButton(
                  child: TextCustom("Sign In",Colors.white,TextAlign.center,type: TextType.small),
                  textColor: Colors.white,
                  onPressed: (){
                    navigate(context,SignInCode());
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

}