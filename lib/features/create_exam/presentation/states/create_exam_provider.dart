import 'dart:math';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/exam_model.dart';
import '../../domain/entities/question_model.dart';

@injectable
class CreateExamProvider extends ChangeNotifier {
  ExamModel _exam = ExamModel(
    lessonId: "lessonId",
    lessonTitle: "lessonTitle",
    examTitle: "examTitle",
    userId: "userId",
    time: 15,
    questions: [
      QuestionModel(
        id: "1",
        title: "1 + 1 =",
        // ignore: prefer_const_literals_to_create_immutables
        options: [
          "1",
          "2",
          "3",
          "4",
        ],
        answer: "2",
      ),
    ],
  );
  ExamModel get exam => _exam;
  set exam(ExamModel value) {
    _exam = value;
    notifyListeners();
  }

  late int _numberOfOptions = _exam.questions.first.options.length;
  int get numberOfOptions => _numberOfOptions;
  set numberOfOptions(int value) {
    _numberOfOptions = value;
    notifyListeners();
  }

  late String _answer = _exam.questions.first.answer;
  String get answer => _answer;
  set answer(String value) {
    _answer = value;
    notifyListeners();
  }

  void updateQuestionTitle(QuestionModel question, String value) {
    exam.questions.firstWhere((element) => element == question).title = value;
    notifyListeners();
  }

  void updateQuestionValues(int index) {
    _numberOfOptions = _exam.questions[index].options.length;
    _answer = _exam.questions[index].answer;
    notifyListeners();
  }

  void deleteQuestion(int index) {
    _exam.questions.removeAt(index);
    notifyListeners();
  }

  void addQuestion() {
    _exam.questions = [
      ..._exam.questions,
      QuestionModel(
        id: "${_exam.questions.length + 1}",
        title: "",
        // ignore: prefer_const_literals_to_create_immutables
        options: [
          "",
        ],
        answer: "",
      ),
    ];
    notifyListeners();
  }

  void addOption(int questionIndex) {
    _numberOfOptions++;
    _exam.questions[questionIndex].options.add("");
    notifyListeners();
  }

  void removeOption(int questionIndex) {
    if (_exam.questions[questionIndex].options.length == 1) {
      return;
    }
    if (_answer.compareTo(_exam.questions[questionIndex].options.last) == 0) {
      _answer = _exam.questions[questionIndex].options.first;
    }
    _numberOfOptions--;
    _exam.questions[questionIndex].options.removeLast();
    notifyListeners();
  }

  double triggerNum = -1;
  void trigger() {
    triggerNum = Random().nextInt(30) +
        Random().nextInt(20) +
        Random().nextInt(10) +
        Random().nextDouble();
    notifyListeners();
  }
}
