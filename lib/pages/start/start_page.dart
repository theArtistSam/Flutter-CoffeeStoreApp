import 'package:coffee_app/pages/dashboard/dashboard_page.dart';
import 'package:coffee_app/utils/constants.dart';
import 'package:coffee_app/utils/font.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            bottom: 300,
            child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(1),
                  Colors.black.withOpacity(0.1)
                ],
                stops: const [0.5, 1.0],
              ).createShader(bounds);
            },
            blendMode: BlendMode.dstIn,
            child: Image.asset(
                'assets/images/homescreen.png',
                fit: BoxFit.cover,
                width: screenWidth,
                height: screenHeight,          
              ),
            ),
          ),          
          Positioned(
            bottom: 0,
            child: Column(
              children: [
                SizedBox(
                  width: screenWidth,                  
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(
                          50
                        ),
                        child: Column(
                          children: [
                            // Heading
                            Font(
                              text: "Coffee so good, your taste buds will love it.",
                              color: primaryTextColorLight,
                              fontSize: 34,
                              textAlign: "Center",
                            ),

                            const SizedBox(height: 10),
                            // Solgan
                            Font(
                              text: "The best grain, the finest, the powerful flavour.",
                              color: secondaryTextColor,
                              fontSize: 14,
                              textAlign: "Center",
                            ),

                            const SizedBox(height: 25),
                            
                            // Button
                            GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const DashboardPage()),
                                );
                              },
                              child: Container(                              
                                width: screenWidth,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(15)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 20),
                                  child: Center(
                                    child: Font(
                                      text: "Get Started",
                                      color: primaryTextColorLight,
                                    ),
                                  )
                                ),
                              ),
                            )                            
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}