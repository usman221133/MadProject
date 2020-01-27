import 'dart:async';

import 'package:flutter/material.dart';


navigate(BuildContext context,Widget route){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => route),
  );
}

navigateDrawer(BuildContext context,Widget route){
  Navigator.of(context).pop();
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => route),
  );
}

navigateClearStack(BuildContext context,Widget route){
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => route),
      ModalRoute.withName("/ROOT")
  );
}



setTimeout(void callback(Timer timer),int time){
  Timer timer;
  timer = Timer(Duration(milliseconds: time), (){
    callback(timer);
  });
}