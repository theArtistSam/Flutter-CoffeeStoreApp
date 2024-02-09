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
  int orderAmount = 1;

  @override
  Widget build(BuildContext context) {
     double screenWidth = MediaQuery.of(context).size.width;
   
    return Scaffold(
      backgroundColor: Colors.white,
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
                GestureDetector(
                  onTap: (){
                    setState(() {                      
                      orderAmount > 1 ? orderAmount-- : null;
                    });
                  },
                  child: Container(
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
                ),
                const SizedBox(width: 20),
                Font(
                  text: '$orderAmount',
                  fontSize: 14,
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      orderAmount++;
                    });
                  },
                  child: Container(
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
                  ),
                )
              ],
            ),
            const Divider(
              height: 40,
              color: borderColor,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: borderColor
                ),
                borderRadius: BorderRadius.circular(14)
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/discount.svg',
                      color: primaryColor,
                    ),
                    const SizedBox(width: 10,),
                    Font(
                      text: "1 Discount is applied",
                      fontSize: 14,
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      'assets/icons/back-arrow.svg',                    
                      color: primaryColor,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Font(
              text: "Payment Summary"
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Font(
                  text: "Price",
                  fontSize: 14,
                  fontWeight: "Regular",
                ),
                const Spacer(),
                Font(
                  text: "\$4.53",
                  fontSize: 14,
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Font(
                  text: "Delivery Fee",
                  fontSize: 14,
                  fontWeight: "Regular",
                ),
                const Spacer(),
                Font(
                  text: "\$2.0",
                  fontSize: 14,
                  lineThrough: "Line-through",
                  fontWeight: "Regular",
                ),
                const SizedBox(width: 10),
                Font(
                  text: "\$1.0",
                  fontSize: 14,                  
                ),
              ],
            ),
            const Divider(
              height: 40,
              color: borderColor,
            ),
            Row(
              children: [
                Font(
                  text: "Total Payment",
                  fontSize: 14,
                  fontWeight: "Regular",
                ),
                const Spacer(),                
                Font(
                  text: "\$5.53",
                  fontSize: 14,                  
                ),
              ],
            ),            
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25)
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xffE4E4E4).withOpacity(0.25),
              spreadRadius: 5,
              blurRadius: 24,
              offset: const Offset(0, -10), // changes position of shadow
            ),
          ],
        ),
        child: BottomAppBar(
          elevation: 0,        
          height: 140,
          color: Colors.transparent,        
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Row(
                  children: [
                      SvgPicture.asset(
                        'assets/icons/discount.svg',
                        color: primaryColor,
                      ),
                      const SizedBox(width: 10),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffF6F6F6),
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(50)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5
                                ),
                                child: Font(
                                  text: "Cash",
                                  fontSize: 12,
                                  fontWeight: "Regular",
                                  color: primaryTextColorLight,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5
                              ),
                              child: Font(
                                text: "\$5.53",
                                fontSize: 12,
                                fontWeight: "Regular",
                              ),
                            ),
                          ],
                        ),                        
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        'assets/icons/dots-filled.svg',
                        color: const Color(0xff808080),
                      )
                    ]
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: screenWidth,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(15) 
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Font(
                        text: "Order",
                        color: primaryTextColorLight,
                        textAlign: "Center",
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}