import 'package:foodie/models/cart_item.dart';

import 'base_model.dart';
import '../locator.dart';
import '../models/cart.dart';
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
      id: "aka",
      name: "Akara, Pap, Milk And Sugar",
      image: "akara.png",
      amount: 30.00,
    ),
    Food(
      id: "yam",
      name: "Boiled Yam, Chicken Stew (Chicken Cooked In Stew)",
      image: "yam.png",
      amount: 10.00,
    ),
    Food(
      id: "nod",
      name: "Plain Spaghetti, Croaker Fish Stew, Fried Plantain Side",
      image: "noodles.png",
      amount: 15.00,
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
      image: "mastercard.png",
      number: "798* **** *783",
    ),
    PaymentMethod(
      name: "PayPal",
      image: "paypal.png",
      number: "982* **** *012",
    )
  ];

  final Cart _cart = Cart(items: []);
  Cart get cart => _cart;

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
