import 'package:coffee_app/utils/constants.dart';
import 'package:coffee_app/utils/font.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SizeTile extends StatefulWidget {
  SizeTile({
    super.key,
    required this.tileText
  });
  
  String tileText;

  @override
  State<SizeTile> createState() => _SizeTileState();
}

class _SizeTileState extends State<SizeTile> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: (){
          setState(() {
            isTapped = !isTapped;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: isTapped ? primaryColorLight : backgroundColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isTapped ? primaryColor :const Color(0xffDEDEDE)
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Font(
              text: widget.tileText,
              fontSize: 14,
              fontWeight: "Regular",  
              textAlign: "Center",   
              color: isTapped ? primaryColor : primaryTextColorDark,           
            ),
          ),
        ),
      ),
    );
  }
}