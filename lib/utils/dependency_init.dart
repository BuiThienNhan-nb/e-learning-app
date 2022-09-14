import 'package:e_learning_app/features/auth/domain/usecases/injection/auth_injection.dart';

import '../core/injection/network_injection_container.dart';

class DependencyInitializer {
  DependencyInitializer._internal();

  static Future<void> init() async {
    await NetworkInjectionContainer.instance.init();
    await AuthInjectionContainer.instance.init();
  }
}
