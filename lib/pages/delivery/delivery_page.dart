import 'package:coffee_app/utils/constants.dart';
import 'package:coffee_app/utils/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeliveryPage extends StatefulWidget {
  const DeliveryPage({super.key});

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  /// create a bottom drawer controller to control the drawer.
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showModalBottomSheet(context);
    });
  }

  

void _showModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height: 315,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
            top: 10,
            bottom: 30,
          ),
          child: Column(
            children: [
              Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: borderColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(height: 15),
              Font(
                text: "10 minutes left",
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Font(
                    text: "Delivery to ",
                    fontSize: 12,
                    color: secondaryTextColor,
                    fontWeight: "Regular",
                  ),
                  Font(
                    text: "Jl. Kpg Sutoyo",
                    fontSize: 12,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 5,
                      decoration: BoxDecoration(
                        color: confirmColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 5,
                      decoration: BoxDecoration(
                        color: confirmColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 5,
                      decoration: BoxDecoration(
                        color: confirmColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 5,
                      decoration: BoxDecoration(
                        color: confirmColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: borderColor,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: borderColor,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(13),
                          child: SvgPicture.asset(
                            'assets/icons/bike.svg',
                            width: 30,
                            height: 30,
                            color: primaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Font(
                              text: "Delivered your order",
                              fontSize: 14,
                            ),
                            const SizedBox(height: 5),
                            Font(
                              text: "We deliver your goods to you in the shortest possible time.",
                              fontSize: 12,
                              fontWeight: "Regular",
                              color: secondaryTextColor,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/images/person.png',
                      fit: BoxFit.cover,
                      width: 55,
                      height: 55,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Font(
                        text: "Johan Hawn",
                        fontSize: 14,
                      ),
                      const SizedBox(height: 8),
                      Font(
                        text: "Personal Courier",
                        fontSize: 12,
                        color: secondaryTextColor,
                        fontWeight: "Regular",
                      ),
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                    child: GestureDetector(
                      onTap: () {
                        // Your onTap functionality here
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: borderColor,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: SvgPicture.asset(
                            'assets/icons/telephone.svg',
                            color: const Color(0xff808080),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // SizedBox(height: gestureBarHeight),
            ],
          ),
        ),
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width; 
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final gestureBarHeight = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/map.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 30 + statusBarHeight
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xffE4E4E4).withOpacity(0.25),
                          spreadRadius: 0,
                          blurRadius: 24,
                          offset: const Offset(0, 4), // changes position of shadow
                        ),                    
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        'assets/icons/back-arrow.svg',
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xffE4E4E4).withOpacity(0.25),
                        spreadRadius: 0,
                        blurRadius: 24,
                        offset: const Offset(0, 4), // changes position of shadow
                      ),                    
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset(
                      'assets/icons/gps.svg',
                    ),
                  ),
                )
              ],
            ),
          ),                  
        ],
      ),
    );
  }
  
}