import 'package:connectivity_plus/connectivity_plus.dart';

import '../platform/network_status.dart';
import 'injection_container.dart';

class NetworkInjectionContainer extends InjectionContainer {
  NetworkInjectionContainer._internal();

  static final NetworkInjectionContainer instance =
      NetworkInjectionContainer._internal();

  @override
  Future<void> init() async {
    getIt.registerLazySingleton<Connectivity>(() => Connectivity());

    getIt.registerLazySingleton<NetworkStatus>(
      () => NetworkStatusImp(getIt()),
    );
  }
}
