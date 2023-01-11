import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class DoExamProvider extends ChangeNotifier {
  int _score = 0;
  int get score => _score;
  set score(int value) {
    _score = value;
    notifyListeners();
  }

  bool _isDone = false;
  bool get isDone => _isDone;
  set isDone(bool value) {
    _isDone = value;
    notifyListeners();
  }

  final List<String?> _answers = [
    null,
    null,
    null,
  ];
  List<String?> get answers => _answers;

  void createAnswerContainer(int count) {
    for (int i = 0; i < count - 1; i++) {
      _answers.add(null);
    }
    notifyListeners();
  }

  void updateAnswers(int index, String value) {
    _answers[index] = value;
    notifyListeners();
  }
}
