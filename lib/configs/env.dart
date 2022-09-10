enum EnvType { dev, prod }

class Env {
  final EnvType envType;
  final String baseUrl;
  final int connectionTimeOut;
  final int receiveTimeOut;

  Env._internal({
    required this.envType,
    required this.baseUrl,
    this.connectionTimeOut = 30000,
    this.receiveTimeOut = 30000,
  });

  factory Env.dev() {
    return Env._internal(
      envType: EnvType.dev,
      baseUrl: 'http://localhost:8080/api',
    );
  }

  factory Env.prod() {
    return Env._internal(
      envType: EnvType.prod,
      baseUrl: '',
    );
  }
}
