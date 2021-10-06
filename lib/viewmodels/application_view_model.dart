import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'base_model.dart';
import '../locator.dart';
import '../models/cart.dart';
import '../models/cart_item.dart';
import '../models/food.dart';
import '../models/payment_method.dart';
import '../services/navigation_service.dart';
import '../ui/views/cart.dart';
import '../ui/views/payment.dart';
import '../ui/views/track.dart';

class ApplicationViewModel extends BaseModel {
  final MyNavigationService _navService = locator<MyNavigationService>();

  List<Food> foods = [
    Food(
      id: 101,
      name: "Akara, Pap, Milk And Sugar",
      image: "akara.png",
      amount: 30.00,
      color: Colors.orangeAccent,
    ),
    Food(
      id: 102,
      name: "Boiled Yam, Chicken Stew (Chicken Cooked In Stew)",
      image: "yam.png",
      amount: 10.00,
      color: Colors.redAccent,
    ),
    Food(
      id: 103,
      name: "Plain Spaghetti, Croaker Fish Stew, Fried Plantain Side",
      image: "noodles.png",
      amount: 15.00,
      color: Colors.greenAccent,
    ),
  ];

  List<PaymentMethod> paymentMethods = [
    PaymentMethod(
      name: "MasterCard",
      image: "mastercard.png",
      number: "902* **** *003",
    ),
    PaymentMethod(
      name: "Visa",
      image: "visa.png",
      number: "798* **** *783",
    ),
    PaymentMethod(
      name: "PayPal",
      image: "paypal.png",
      number: "982* **** *012",
    )
  ];

  String? selectedPaymentMethod;
  void setSelectedPaymentMethod(m) {
    selectedPaymentMethod = m;
    notifyListeners();
  }

  final Cart _cart = Cart(items: []);
  Cart get cart => _cart;

  removeItemFromCart({required CartItem item}) {
    CartItem? it = cart.items!.firstWhereOrNull(
      (el) => el.food.id == item.food.id,
    );

    if (it != null) {
      cart.items!.remove(it);
      notifyListeners();
    }
  }

  increaseItemInCart({required CartItem item}) {
    cart.add(item);
    notifyListeners();
  }

  decreaseItemInCart({required CartItem item}) {
    CartItem? it = cart.items!.firstWhereOrNull(
      (el) => el.food.id == item.food.id,
    );

    if (it != null) {
      if (it.quantity > 1) {
        --it.quantity;
      } else {
        cart.items!.remove(it);
      }
      notifyListeners();
    }
  }

  Future handleSplashLogic() async {
    Future.delayed(const Duration(seconds: 2), () async {
      to("cart", replace: true);

      // empty cart first
      cart.empty();

      // setup default cart items
      for (Food food in foods) {
        cart.add(CartItem(food: food));
      }
      notifyListeners();
    });
  }

  void goBack() {
    _navService.pop();
  }

  void to(String route, {bool replace = false}) {
    String? toRoute;

    switch (route) {
      case "cart":
        toRoute = CartScreen.routeName;
        break;
      case "payment":
        toRoute = PaymentScreen.routeName;
        break;
      case "order.track":
        toRoute = TrackOrderScreen.routeName;
        break;
    }

    if (toRoute!.isNotEmpty) {
      _navService.navigateTo(toRoute, replace: replace);
    }
  }
}
