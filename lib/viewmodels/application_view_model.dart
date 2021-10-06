import 'base_model.dart';
import '../locator.dart';
import '../services/navigation_service.dart';
import '../ui/views/cart.dart';
import '../ui/views/payment.dart';
import '../ui/views/track.dart';

class ApplicationViewModel extends BaseModel {
  final MyNavigationService _navService = locator<MyNavigationService>();

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
