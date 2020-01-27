import 'package:carpool/base/AppStyles.dart';
import 'package:carpool/base/Utils.dart';
import 'package:carpool/pages/HomeMap.dart';
import 'package:carpool/widgets/TextCustom.dart';
import 'package:carpool/widgets/app_bar_large_rounded.dart';
import 'package:carpool/widgets/text_logo.dart';
import 'package:code_input/code_input.dart';
import 'package:flutter/material.dart';

class SignInCode extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new ListView(
        children: <Widget>[
          AppBarLargeRounded(
            TextLogo(),
            showBack: true,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextCustom("Verify Your Phone!",Colors.black,TextAlign.start,type: TextType.heading),
                    SizedBox(
                      height: 5,
                    ),
                    TextCustom("Simply enter the code you'd received on your number to get moving with Chalo Bhai!",Colors.black87,TextAlign.start,type: TextType.xSmall),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CodeInput(
                      length: 4,
                      keyboardType: TextInputType.number,
                      builder: CodeInputBuilders.circle(
                        color: PoolColors.primary,
                        border: Border(),
                        textStyle: TextStyle(color: Colors.white,fontSize: 23,fontWeight: FontWeight.w300)
                      ),
                      onFilled: (value){
                          navigate(context,HomeMap());
                      },
                    ),
                  ],
                ),
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              ),
            ],
          )
        ],
      ),
    );
  }

}