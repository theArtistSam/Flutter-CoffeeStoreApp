import 'dart:ui';

import 'package:coffee_app/utils/constants.dart';
import 'package:coffee_app/utils/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class ProductTile extends StatelessWidget {
  ProductTile({
    super.key,
    required this.productImage,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productRating,
  });

  String productImage;
  String productName;
  String productDescription;
  double productPrice;
  double productRating;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    
    return Container(
      // width: 150,
      decoration: BoxDecoration(
        color: primaryTextColorLight,
        borderRadius: BorderRadius.circular(16)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
              child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/images/$productImage',
                    fit: BoxFit.cover,
                    width: screenWidth,
                    height: 135,
                  ),
                ),
                
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16)
                  ),
                  child: SizedBox(
                    width: 50,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/icons/star.svg'),
                            Font(
                              text: "$productRating",
                              color: primaryTextColorLight,
                              fontSize: 10,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          
          Padding(                    
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Font(
                  text: productName
                ),
                Font(
                  text: productDescription,
                  fontSize: 12,
                  color: secondaryTextColor,
                  fontWeight: "Regular",
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Font(
                        text: "\$$productPrice",
                        fontSize: 18,
                        color: priceTextColor,
                      ),
                    ),                            
                    Container(
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          'assets/icons/plus.svg',
                          color: primaryTextColorLight,
                        ),
                      ),
                    )
                  ],
                )
                
              ],
            ),                        
          )
        ],
      ),
    );
  }
}