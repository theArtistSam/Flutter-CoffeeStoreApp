import 'package:coffee_app/utils/constants.dart';
import 'package:coffee_app/utils/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  bool isDelivered = true;
  bool isPickedUp = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: SvgPicture.asset('assets/icons/back-arrow.svg'),
              onPressed: () {
                // Add your onPressed logic here
              },
            ),           
            title: Font(
              text: "Order",
              fontSize: 18,
            ),
            centerTitle: true, // Aligns the title in the center
          ),
        )
      ),
      body: Padding(
         padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 10
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [            
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xffF2F2F2),
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isDelivered = true;
                            isPickedUp = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isDelivered? primaryColor : const Color(0xffF2F2F2),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Font(
                              text: "Deliver",
                              color: isDelivered ? primaryTextColorLight : primaryTextColorDark,
                              textAlign: "Center",
                              fontWeight: isDelivered ? "Semi-Bold" : "Regular",
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isDelivered = false;
                            isPickedUp = true;
                          });
                        },
                      child: Container(
                          decoration: BoxDecoration(
                            color: isPickedUp ? primaryColor : const Color(0xffF2F2F2),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Font(
                              text: "Pick Up",
                              color: isPickedUp ? primaryTextColorLight : primaryTextColorDark,
                              textAlign: "Center",
                              fontWeight: isPickedUp ? "Semi-Bold" : "Regular",
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Font(
              text: "Delivery Address"
            ),
            const SizedBox(height: 10),
            Font(
              text: "Jl. Kpg Sutoyo",
              fontSize: 14,
            ),
            const SizedBox(height: 5),
            Font(
              text: "Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.",
              fontSize: 12,
              color: secondaryTextColor,
              fontWeight: "Regular",
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: borderColor
                    ),
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/edit.svg'),
                        const SizedBox(width: 5),
                        Font(
                          text: "Edit Address",
                          fontSize: 12,
                          fontWeight: "Regular",
                          color: primaryTextColorDark,                      
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: borderColor
                    ),
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/note.svg',
                        ),
                        const SizedBox(width: 5),
                        Font(
                          text: "Add Note",
                          fontSize: 12,
                          fontWeight: "Regular",
                          color: primaryTextColorDark,                      
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              height: 40,
              color: borderColor,              
            ),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/coffee-1.png',
                    width: 55,
                    height: 55,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Font(text: "Cappucino"),
                    const SizedBox(height: 5),
                    Font(
                      text: "with Chocolate",
                      fontSize: 12,
                      fontWeight: "Regular",
                      color: secondaryTextColor,
                    )
                  ],
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: borderColor
                    ),
                    borderRadius: BorderRadius.circular(100)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SvgPicture.asset('assets/icons/minus.svg'),
                  ),
                ),
                const SizedBox(width: 20),
                Font(
                  text: '1',
                  fontSize: 14,
                ),
                const SizedBox(width: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: borderColor
                    ),
                    borderRadius: BorderRadius.circular(100)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SvgPicture.asset('assets/icons/plus.svg'),
                  ),
                )
              ],
            )
            
          ],
        ),
      ),
    );
  }
}