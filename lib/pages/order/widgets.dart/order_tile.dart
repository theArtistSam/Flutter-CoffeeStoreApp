import 'package:coffee_app/models/order_model.dart';
import 'package:coffee_app/utils/constants.dart';
import 'package:coffee_app/utils/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class OrderTile extends StatefulWidget {
  OrderTile({
    super.key,
    required this.order,
    required this.onUpdateOrder,
    required this.onRemoveOrder,    
  });

  OrderModel order;
  final Function(OrderModel) onUpdateOrder;
  final Function(OrderModel) onRemoveOrder;

  @override
  State<OrderTile> createState() => _OrderTileState();
}

class _OrderTileState extends State<OrderTile> {
    
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            'assets/images/${widget.order.product.productImage}',
            width: 55,
            height: 55,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Font(text: widget.order.product.productName),
            const SizedBox(height: 5),
            Font(
              text: widget.order.product.productTagLine,
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
             if (widget.order.orderAmount > 1){
                widget.order.orderAmount --;
                widget.onUpdateOrder(widget.order);
             }else{
              widget.onRemoveOrder(widget.order);
             }
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
          text: '${widget.order.orderAmount}',
          fontSize: 14,
        ),
        const SizedBox(width: 20),
        GestureDetector(
          onTap: (){
            setState(() {
              widget.order.orderAmount++;
              widget.onUpdateOrder(widget.order);
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
    );
  }
}