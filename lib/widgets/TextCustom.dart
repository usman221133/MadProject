import 'package:flutter/material.dart';

enum TextType {
  small,medium,large,heading,tabText,mid,xSmall
}


class TextCustom extends StatelessWidget {
  final String text;
  final TextType type;
  final bool isBold;
  final TextAlign align;
  final Color color;

  TextCustom(this.text,this.color,this.align,{this.type = TextType.medium,this.isBold = false});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: getFontStyle(),textAlign: align) ;
  }


  TextStyle getFontStyle(){
    if(type == TextType.mid){
      return TextStyle(fontSize: 16,fontWeight:(isBold ?FontWeight.bold: null),color:this.color);
    }else if(type == TextType.medium){
      return TextStyle(fontSize: 18,fontWeight:(isBold ?FontWeight.bold: null),color:this.color);
    }else if(type == TextType.large){
      return TextStyle(fontSize: 30,fontWeight:(isBold ?FontWeight.bold: null),color:this.color);
    }else if(type == TextType.tabText){
      return TextStyle(fontSize: 12,fontWeight:(isBold ?FontWeight.bold: null),color:this.color);
    }else if(type == TextType.heading){
      return TextStyle(fontSize: 24,fontWeight:(isBold ?FontWeight.bold: null),color:this.color);
    } else if(type == TextType.small){
      return TextStyle(fontSize: 15,fontWeight:(isBold ?FontWeight.bold: null),color:this.color);
    }else{
      return TextStyle(fontSize: 13,fontWeight:(isBold ?FontWeight.bold: null),color:this.color);
    }
  }

}