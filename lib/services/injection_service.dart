import 'package:chat_app/services/navigation_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  // Register NavigationService as a Singleton
  getIt.registerSingleton<NavigationService>(NavigationService());
}