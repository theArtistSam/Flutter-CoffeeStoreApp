import 'package:coffee_app/utils/constants.dart';
import 'package:coffee_app/utils/font.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ScrollTile extends StatelessWidget {
  const ScrollTile({
    super.key,
    required this.title,
    required this.onTap,
    this.isSelected = false,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Font(
            text: title,
            fontSize: 14,
            fontWeight: isSelected ? "Semi-Bold" : "Regular",
            color: isSelected ? primaryTextColorLight : primaryTextColorDark,
          ),
        ),
      ),
    );
  }
}
