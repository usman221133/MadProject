import 'package:carpool/base/Utils.dart';
import 'package:carpool/widgets/text_logo.dart';
import 'package:flutter/material.dart';

import 'SignIn.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    setTimeout((timer){
      timer.cancel();
      navigateClearStack(context,SignIn());
    },1000);
    return new Scaffold(
      backgroundColor: Colors.orange,
      body: new Center(
        child: TextLogo(),
      ),
    );
  }

}