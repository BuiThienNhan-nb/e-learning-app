import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  Env._internal();

  static Env instance = Env._internal();

  factory Env() => instance;

  final String test = dotenv.get('TEST');

  final String baseUrl = dotenv.get('BASE_URL');
  final String createExamUrl = dotenv.get('CREATE_EXAM_URL');
  final String doExamUrl = dotenv.get('DO_EXAM_URL');
  final String webViewUrl = dotenv.get('WEB_VIEW_URL');
  final int connectionTimeOut = int.parse(dotenv.get('CONNECTION_TIMEOUT'));
  final int receiveTimeOut = int.parse(dotenv.get('RECEIVE_TIMEOUT'));
}
