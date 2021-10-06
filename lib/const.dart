import 'models/food.dart';
import 'models/payment_method.dart';

const String appName = "Foodie";

List<Food> foods = [
  Food(
    name: "Akara, Pap, Milk And Sugar",
    image: "akara.png",
    amount: 30.00,
  ),
  Food(
    name: "Boiled Yam, Chicken Stew (Chicken Cooked In Stew)",
    image: "yam.png",
    amount: 10.00,
  ),
  Food(
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
