// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:foodie/models/cart_item.dart';
import 'package:foodie/ui/shared/ui_helpers.dart';
import 'package:foodie/ui/widgets/cart_item_card.dart';
import 'package:provider_architecture/provider_architecture.dart';

import '../../locator.dart';
import '../../viewmodels/application_view_model.dart';
import '../shared/app_styles.dart';
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
                const Text("hello"),
              ],
            ),
          ),
        );
      },
    );
  }
}
