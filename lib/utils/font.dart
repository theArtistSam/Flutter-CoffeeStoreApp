import 'package:coffee_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Font extends StatelessWidget {
  Font({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.backgroundColor,
    this.lineThrough
  });

  String text;
  Color? color = primaryTextColorDark;
  double? fontSize = 16;
  String? fontWeight;
  String? textAlign;
  Color? backgroundColor;
  String? lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.sora(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight == "Regular" ? FontWeight.w400 : FontWeight.w600        ,
        background: backgroundColor != null ? (Paint()..color = backgroundColor!) : null,
        decoration: lineThrough == "Line-through" ? TextDecoration.lineThrough : null
      ),
      textAlign: textAlign == "Center" ? TextAlign.center : TextAlign.left,
      
    );
  }
}