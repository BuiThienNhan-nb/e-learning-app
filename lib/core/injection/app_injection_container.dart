import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_learning_app/core/app/provider.dart';

import '../platform/network_status.dart';
import 'injection_container.dart';

class AppInjectionContainer extends InjectionContainer {
  AppInjectionContainer._internal();

  static final AppInjectionContainer instance =
      AppInjectionContainer._internal();

  @override
  Future<void> init() async {
    // Create injection for app provider
    getIt.registerLazySingleton<AppProvider>(
      () => AppProvider(),
    );

    // Create injection for network status
    getIt.registerLazySingleton<Connectivity>(
      () => Connectivity(),
    );

    getIt.registerLazySingleton<NetworkStatus>(
      () => NetworkStatusImp(getIt()),
    );
  }
}
