class PaymentMethod {
  final String name;
  final String image;
  final String number;

  PaymentMethod({
    required this.name,
    required this.image,
    required this.number,
  });
}

List<PaymentMethod> _methods = [
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
