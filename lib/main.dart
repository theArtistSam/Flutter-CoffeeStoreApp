import 'package:coffee_app/pages/dashboard/dashboard_page.dart';
import 'package:coffee_app/pages/detail/detail_page.dart';
import 'package:coffee_app/pages/order/order_page.dart';
import 'package:coffee_app/pages/start/start_page.dart';
import 'package:flutter/services.dart' as services;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     services.SystemChrome.setSystemUIOverlayStyle(
      const services.SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarDividerColor: Colors.transparent // Set the desired background color              
        ),
      );

      services.SystemChrome.setEnabledSystemUIMode(
        services.SystemUiMode.edgeToEdge,
          overlays: [services.SystemUiOverlay.top]
        );
      return MaterialApp(
        title: 'Coffee Application',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
          textTheme: GoogleFonts.soraTextTheme(
            
            // Replace 'Poppins' with your desired font family
            Theme.of(context).textTheme,
          ),
      ),
      home: const DetailPage(),
    );
  }
}