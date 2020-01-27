import 'package:carpool/base/AppStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppBarLargeRounded extends StatelessWidget {
  final Widget child;
  final bool showBack;


  AppBarLargeRounded(this.child, {this.showBack = false});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Transform.scale(
          child: Container(
            height: screenSize.height/3,
            decoration: BoxDecoration(
                color:PoolColors.primary,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(screenSize.width),
                    bottomRight: Radius.circular(screenSize.width)
                )
            ),
            margin: EdgeInsets.only(bottom: 130),
          ),
          scale: 3,
        ),
        Container(
          height: screenSize.height/2,
          child: Center(
            child: child,
          ),
        ),
        (showBack ? Positioned(
          top: 20,
          left: 20,
          child: InkWell(
            child: Image.asset("images/back.png",width: 30,color: Colors.white),
            onTap: (){
              Navigator.of(context).pop();
            },
          ),
        ) : SizedBox())
      ],
    );
  }
}
