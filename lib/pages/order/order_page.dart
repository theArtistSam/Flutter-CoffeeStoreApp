import 'package:coffee_app/models/order_model.dart';
import 'package:coffee_app/pages/delivery/delivery_page.dart';
import 'package:coffee_app/pages/order/widgets.dart/order_tile.dart';
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

  double getTotalOrderAmount() {    
    double amount = 0;
    for (var order in orderList) {
      amount += order.product.productPrice * order.orderAmount;
    }
    return double.parse(amount.toStringAsFixed(2));
  }


  

  void updateOrder(OrderModel updatedOrder) {
    // Update the order in the list
    setState(() {
      orderList[orderList.indexOf(updatedOrder)] = updatedOrder;
    });
  }
  void removeOrder(OrderModel removedOrder) {
  // Remove the order from the list
    setState(() {
      orderList.remove(removedOrder);
    });
    
    if (orderList.isEmpty){
      setState(() {        
        const snackBar = SnackBar(
          content: Text('Order cart is empty'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.pop(context);
      });
    }
  }
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
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: SvgPicture.asset('assets/icons/back-arrow.svg'),
              onPressed: () {
                Navigator.pop(context);
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
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
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: orderList.length,
                separatorBuilder: (BuildContext context, int index){
                  return const SizedBox(height: 10);
                } ,
                itemBuilder: (BuildContext context, int index) {
                  return OrderTile(
                    order: orderList[index],
                    onUpdateOrder: updateOrder,
                    onRemoveOrder: removeOrder,
                  );              
                },
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
                        'assets/icons/arrow-right.svg',                    
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
                    text: "\$${getTotalOrderAmount()}",
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
                    text: "\$${getTotalOrderAmount() + 1}",
                    fontSize: 14,                  
                  ),
                ],
              ),            
            ],
          ),
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
                                text: "\$${getTotalOrderAmount() + 1}",
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
                  GestureDetector(
                    onTap: (){
                      orderList.clear();
                      const snackBar = SnackBar(
                          content: Text('Order completed!'),
                        );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const DeliveryPage(),
                      ));                      
                    },
                    child: Container(
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