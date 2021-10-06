import 'package:foodie/viewmodels/application_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart' as ss;

import 'services/navigation_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => ss.NavigationService());
  locator.registerLazySingleton(() => MyNavigationService());

  locator.registerLazySingleton(() => ApplicationViewModel());
}
