import 'package:collection/collection.dart';
import 'cart_item.dart';

class Cart {
  List<CartItem>? items = [];

  Cart({this.items});

  get sum {
    if (hasItems) {
      return items!.map((item) => item.total).reduce((a, b) => a + b);
    }
    return 0;
  }

  bool get hasItems {
    return items!.isNotEmpty;
  }

  bool add(CartItem item) {
    CartItem? it = items!.firstWhereOrNull((l) => l.food.id == item.food.id);

    if (it != null) {
      it.quantity++;
    } else {
      items!.insert(0, item);
    }

    return true;
  }

  bool remove(CartItem item) {
    items!.removeWhere((it) => it.food.id == item.food.id);

    return true;
  }

  bool empty() {
    items = [];

    return true;
  }
}
