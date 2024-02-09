import 'dart:ui';
import 'package:coffee_app/models/product_model.dart';
import 'package:coffee_app/pages/detail/detail_page.dart';
import 'package:coffee_app/utils/constants.dart';
import 'package:coffee_app/utils/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class ProductTile extends StatelessWidget {
  ProductTile({
    super.key,
    required this.product,  
  });

  ProductModel product;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPage(product: product)),
        );
      },
      child: Container(
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
                      'assets/images/${product.productImage}',
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
                                text: "${product.productRating}",
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
                    text: product.productName
                  ),
                  Font(
                    text: product.productTagLine,
                    fontSize: 12,
                    color: secondaryTextColor,
                    fontWeight: "Regular",
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Font(
                          text: "\$${product.productPrice}",
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
      ),
    );
  }
}