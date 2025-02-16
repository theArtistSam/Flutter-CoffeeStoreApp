import 'package:coffee_app/models/product_model.dart';
import 'package:coffee_app/pages/dashboard/widgets/product_tile.dart';
import 'package:coffee_app/pages/dashboard/widgets/scroll_tile.dart';
import 'package:coffee_app/utils/constants.dart';
import 'package:coffee_app/utils/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String dropdownValue = 'Bilzen, Tanjungblai';
  final TextEditingController _textEditingController = TextEditingController();

  List<String> scrollTileItems = [
    "Cappuccino",
    "Machiato",
    "Latte",
    "Americano"
  ];
  final ScrollController _outerController = ScrollController();
  final ScrollController _innerController = ScrollController();

  bool isSticky = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _outerController.dispose();
    _innerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final statusBarHeight = MediaQuery.of(context).padding.top;

    // Grid view count for products
    int gridCount() {
      if (screenWidth > 160) {
        return (screenWidth ~/ 150).toInt();
      }
      return 1;
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false, // Disable the back button
        centerTitle: false,
        surfaceTintColor: backgroundColor,
        title: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Location text
              Font(
                text: "Location",
                fontWeight: "Regular",
                fontSize: 12,
                color: secondaryTextColor,
              ),

              // Dropdown menu
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  icon: SvgPicture.asset('assets/icons/arrow-down.svg'),
                  focusColor: backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                  value: dropdownValue,
                  items: <String>[
                    'Bilzen, Tanjungblai',
                    'Los Angeles, CA',
                    'New York, NY',
                    'London, England'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Font(
                        text: value,
                        fontSize: 14,
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                ),
              )
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/images/person.png',
                fit: BoxFit.cover,
                width: 45,
                height: 45,
              ),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Personal Detials
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              children: [
                TextField(
                  onChanged: (value) {
                    // print('Text changed: $value');
                  },
                  style: GoogleFonts.sora(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: primaryColorLight,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: SvgPicture.asset(
                        'assets/icons/search-unfilled.svg',
                        color: primaryColorLight,
                      ),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 7.0),
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: SvgPicture.asset(
                            'assets/icons/customize.svg',
                            color: primaryTextColorLight,
                          ),
                        ),
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(20),
                    hintText: "Search coffee...",
                    hintStyle: GoogleFonts.sora(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: secondaryTextColor,
                    ),

                    // Border when NOT focused
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),

                    // Border when focused
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),

                    // Background color
                    filled: true,
                    fillColor: primaryTextColorDark,
                  ),
                ),
                const SizedBox(height: 20),
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/images/offer.png',
                        fit: BoxFit.cover,
                        width: screenWidth,
                        height: 170,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 23,
                        vertical: 13,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: const Color(0xffEd5151),
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              padding: const EdgeInsets.all(6),
                              child: Font(
                                text: "Promo",
                                fontSize: 14,
                                color: primaryTextColorLight,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: 200,
                            child: Font(
                              text: "Buy one get one Free",
                              fontSize: 32,
                              color: primaryTextColorLight,
                              backgroundColor: primaryTextColorDark,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 25),
                SizedBox(
                  height: 40,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: scrollTileItems.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(width: 10);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return ScrollTile(tileText: scrollTileItems[index]);
                    },
                  ),
                ),
                const SizedBox(height: 25),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 20),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: gridCount(),
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: .715,
                  ),
                  itemCount: allProducts.length,
                  itemBuilder: (context, index) {
                    final product = allProducts[index];
                    return ProductTile(product: product);
                  },
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 25,
              offset: const Offset(0, -10),
              spreadRadius: 0,
              color: const Color(0xffE4E4E4).withValues(alpha: 0.25),
            )
          ],
        ),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: primaryColor,
          onTap: (int index) {
            // set the index of the scaffold page
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/home-filled.svg',
                color: primaryColor,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/heart-unfilled.svg',
                color: secondaryTextColor,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/bag-filled.svg',
                color: secondaryTextColor,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/notification-filled.svg',
                color: secondaryTextColor,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
