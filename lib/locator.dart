import 'package:homeauto/services/navigator_service.dart';
import 'package:get_it/get_it.dart';
import 'package:homeauto/services/rmq_service.dart';


GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => RMQService());

}
