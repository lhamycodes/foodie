// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:io';

import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:foodie/ui/widgets/app_button.dart';
import 'package:foodie/ui/widgets/input.dart';
import 'package:intl/intl.dart';
import 'package:provider_architecture/provider_architecture.dart';

import '../../locator.dart';
import '../../models/cart_item.dart';
import '../../viewmodels/application_view_model.dart';
import '../shared/app_styles.dart';
import '../shared/ui_helpers.dart';
import '../widgets/cart_item_card.dart';
import '../widgets/title_text.dart';
import '../widgets/app_scaffold.dart';

class CartScreen extends StatefulWidget {
  static const routeName = '/app/cart';

  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ApplicationViewModel>.withConsumer(
      viewModelBuilder: () => locator<ApplicationViewModel>(),
      disposeViewModel: false,
      builder: (context, model, child) {
        return AppScaffold(
          title: "Cart 🛒",
          child: Container(
            padding: scaffoldPadding,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (cx, i) {
                        CartItem item = model.cart.items![i];
                        return Dismissible(
                          key: ValueKey<int>(item.food.id),
                          background: Container(
                            width: double.infinity,
                            color: const Color(0xFFf7e7e7),
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 30),
                            child: const Icon(
                              FeatherIcons.trash2,
                              color: Color(0xFFdf3e48),
                            ),
                          ),
                          onDismissed: (direction) => model.removeItemFromCart(
                            item: item,
                          ),
                          child: CartItemCard(
                            food: item.food,
                            itemQuantity: item.quantity,
                            onIncrease: () => model.increaseItemInCart(
                              item: item,
                            ),
                            onDecrease: () => model.decreaseItemInCart(
                              item: item,
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (_, __) => verticalSpace(20),
                      itemCount: model.cart.items?.length ?? 0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: Platform.isAndroid ? 20 : 40,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Input(
                          hintText: "Promo Code",
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(6),
                            child: AppButton(
                              title: "Apply",
                              onPressed: () {},
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                      verticalSpace(20),
                      TitleText(
                        title: "Item Total",
                        text: NumberFormat.currency(
                          symbol: '\$',
                          decimalDigits: 2,
                        ).format(model.cart.sum),
                      ),
                      const Divider(height: 30),
                      TitleText(
                        title: "Total",
                        text: NumberFormat.currency(
                          symbol: '\$',
                          decimalDigits: 2,
                        ).format(model.cart.sum),
                      ),
                      verticalSpace(20),
                      SizedBox(
                        width: double.infinity,
                        child: AppButton(
                          title: "Payment",
                          onPressed: () => model.to("payment"),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
