// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../shared/app_colors.dart';
import '../shared/ui_helpers.dart';
import '../../models/food.dart';

class CartItemCard extends StatefulWidget {
  final Food food;
  final int itemQuantity;
  final void Function()? onIncrease;
  final void Function()? onDecrease;

  const CartItemCard({
    Key? key,
    required this.food,
    this.itemQuantity = 0,
    this.onIncrease,
    this.onDecrease,
  }) : super(key: key);

  @override
  _CartItemCardState createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 0.5,
            color: Colors.black.withOpacity(.3),
            offset: const Offset(0.5, 0.5),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/${widget.food.image}",
            height: 100,
            width: 100,
          ),
          horizontalSpace(10),
          Expanded(
            child: SizedBox(
              height: 102,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.food.name,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  verticalSpace(5),
                  Text(
                    NumberFormat.currency(symbol: '\$', decimalDigits: 2)
                        .format(widget.food.amount),
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          horizontalSpace(10),
          SizedBox(
            height: 102,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: widget.onDecrease,
                  child: const Icon(
                    FeatherIcons.minusCircle,
                    color: primaryColor,
                    size: 30,
                  ),
                ),
                Text(
                  widget.itemQuantity.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: widget.onIncrease,
                  child: const Icon(
                    Icons.add_circle,
                    color: primaryColor,
                    size: 35,
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
