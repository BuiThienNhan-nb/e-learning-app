import 'dart:math';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../top/domain/entities/course_model.dart';
import '../../../../home/domain/entities/lesson_model.dart';
import '../../../../home/domain/entities/section_model.dart';

@injectable
class UpdateCourseProvider extends ChangeNotifier {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  GlobalKey<FormState> get key => _key;
  late CourseModel _course = CourseModel(
    id: "",
    title: "",
    description: "",
    rates: 0,
    votes: 0,
    image: "",
    category: const ["3D Design"],
    price: 0,
    section: const [],
    haveCertificate: false,
    categories: const [],
  );
  CourseModel get course => _course;
  int _stepIndex = 0;
  int get stepIndex => _stepIndex;
  late final PageController _controller =
      PageController(initialPage: _stepIndex, keepPage: true);
  PageController get controller => _controller;
  bool _isUpdateImage = false;
  bool get isUpdateImage => _isUpdateImage;

  set stepIndex(int value) {
    _stepIndex = value;
    notifyListeners();
  }

  set isUpdateImage(bool value) {
    _isUpdateImage = value;
    notifyListeners();
  }

  void navigatePageView() {
    _controller.animateToPage(
      _stepIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }

  // Form values
  final TextEditingController category = TextEditingController();
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();

  set course(CourseModel course) {
    _course = course;
    title.text = _course.title;
    category.text = _course.category.first;
    description.text = _course.description;
    notifyListeners();
  }

  void updateCourseVariable() {
    _course.title = title.text.trim();
    _course.description = description.text.trim();
    _course.category.first = category.text.trim();
  }

  void addSection(SectionModel section) {
    _course.section.add(section);
    notifyListeners();
  }

  void deleteSectionAtIndex(int index) {
    _course.section.removeAt(index);
    notifyListeners();
  }

  int _countCurrentSection() {
    int count = 0;
    for (int i = 0; i < _course.section.length; i++) {
      if (i == _course.section.length - 1) return count = i;
      if (_course.section[i + 1].lessons.isEmpty) return count = i;
    }
    return count;
  }

  int _getLessonOrder() {
    int order = 0;
    for (var s in _course.section) {
      order += s.lessons.length;
    }
    return order + 1;
  }

  int countCurrentLessonOrder(int sectionIndex, int lessonIndex) {
    if (sectionIndex == 0) return lessonIndex + 1;
    int currentOrder = 0;
    for (int i = 0; i < sectionIndex; i++) {
      currentOrder += _course.section[i].lessons.length;
    }
    return currentOrder + lessonIndex + 1;
  }

  // void addLesson() {
  //   _course.section[_countCurrentSection()].lessons.add(
  //     LessonModel(
  //       id: "id_${Random().nextBool()}_${Random().nextBool()}",
  //       order: _getLessonOrder(),
  //       title: "",
  //       videoUrl: "",
  //       length: 0,
  //     ),
  //   );
  // }

  void addLesson(int sectionIndex) {
    _course.section[sectionIndex].lessons.add(
      LessonModel(
        id: "id_${Random().nextBool()}_${Random().nextBool()}",
        order: _course.section[sectionIndex].lessons.length + 1,
        title: "",
        videoUrl: "",
        length: 0,
      ),
    );
    // update course order
    for (int i = sectionIndex + 1; i < _course.section.length; i++) {
      for (var lesson in _course.section[i].lessons) {
        lesson.order++;
      }
    }
    notifyListeners();
  }

  void deleteLesson(int sectionIndex, int lessonIndex) {
    _course.section[sectionIndex].lessons.removeAt(lessonIndex);
    // update course order
    for (int i = lessonIndex;
        i < _course.section[sectionIndex].lessons.length - 1;
        i++) {
      _course.section[sectionIndex].lessons[i].order--;
    }
    for (int i = sectionIndex + 1; i < _course.section.length; i++) {
      for (var lesson in _course.section[i].lessons) {
        lesson.order--;
      }
    }
    notifyListeners();
  }

  void removeLessonAt(int sectionOrder, int index) {
    _course.section[sectionOrder].lessons.removeAt(index);
    notifyListeners();
  }

  void insertLessonAt(int sectionOrder, int index, LessonModel lesson) {
    _course.section[sectionOrder].lessons.insert(index, lesson);
    notifyListeners();
  }

  void addLessonInSection(int sectionOrder, LessonModel lesson) {
    _course.section[sectionOrder].lessons.add(lesson);
    notifyListeners();
  }

  @override
  // ignore: must_call_super, unnecessary_overrides
  void dispose() {
    // super.dispose();
  }

  void myDispose() {
    super.dispose();
  }
}
