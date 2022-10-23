import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

abstract class NetworkStatus {
  Future<bool> get isConnected;
}

@Injectable(as: NetworkStatus)
class NetworkStatusImp implements NetworkStatus {
  final Connectivity connectivity = Connectivity();

  @override
  Future<bool> get isConnected async {
    final result = await connectivity.checkConnectivity();

    if (result == ConnectivityResult.none) return false;

    return true;
  }
}
