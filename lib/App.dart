import 'package:carpool/pages/Splash.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        textTheme: TextTheme(
          title: TextStyle(color: Colors.white,fontFamily: "Montserrat")
        ),
        appBarTheme: AppBarTheme(
          color: Colors.orange,
          brightness: Brightness.dark,
          textTheme: TextTheme(
            title: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w300,fontFamily: "Montserrat"),
          ),
          iconTheme: IconThemeData(
            color: Colors.white
          )
        ),
        fontFamily: "Montserrat",
        buttonColor: Colors.orange,
      ),
      home: Splash(),
    );
  }
}