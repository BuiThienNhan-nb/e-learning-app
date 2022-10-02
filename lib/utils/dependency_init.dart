import '../core/injection/network_injection_container.dart';
import '../features/auth/sign_in/domain/usecases/injection/auth_injection.dart';

class DependencyInitializer {
  DependencyInitializer._internal();

  static Future<void> init() async {
    await NetworkInjectionContainer.instance.init();
    await AuthInjectionContainer.instance.init();
  }
}
