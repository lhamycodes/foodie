class Food {
  final String name;
  final String image;
  final double amount;

  Food({
    required this.name,
    required this.image,
    required this.amount,
  });
}

List<Food> _foods = [
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
