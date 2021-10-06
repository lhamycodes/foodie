import 'food.dart';

class CartItem {
  Food food;
  int quantity;

  CartItem({
    required this.food,
    this.quantity = 1,
  });

  get total {
    return quantity * food.amount;
  }
}
