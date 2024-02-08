import 'package:coffee_app/utils/constants.dart';
import 'package:coffee_app/utils/font.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ScrollTile extends StatefulWidget {
  ScrollTile({
    super.key,
    required this.tileText
  });

  String tileText;

  @override
  State<ScrollTile> createState() => _ScrollTileState();
}

class _ScrollTileState extends State<ScrollTile> {
  bool isTapped = false;  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          isTapped = !isTapped;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isTapped ? primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Font(
            text: widget.tileText,
            fontSize: 14,
            fontWeight: isTapped ? "Semi-Bold" : "Regular",
            color: isTapped ? primaryTextColorLight : primaryTextColorDark,
          ),
        )
      ),
    );
  }
}