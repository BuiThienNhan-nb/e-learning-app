import 'package:e_learning_app/features/home/domain/entities/section_model.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateCourseProvider extends ChangeNotifier {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  GlobalKey<FormState> get key => _key;

  // Form values
  final TextEditingController category = TextEditingController();
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  String _imageSource = "";
  bool _isPremium = false;
  final List<SectionModel> _sections = [];
  // int _lessonOrder = 1;

  String get imageSource => _imageSource;
  bool get isPremium => _isPremium;
  List<SectionModel> get sections => _sections;
  // int get lessonOrder => _lessonOrder;
  // final TextEditingController imageSource = TextEditingController();

  set imageSource(String val) {
    _imageSource = val;
    notifyListeners();
  }

  set isPremium(bool val) {
    _isPremium = val;
    notifyListeners();
  }

  // set lessonOrder(int value) {
  //   _lessonOrder = value;
  //   notifyListeners();
  // }

  void addSection(SectionModel section) {
    _sections.add(section);
    notifyListeners();
  }

  void deleteSection(int index) {
    _sections.removeAt(index);
    notifyListeners();
  }

  int getLessonOrder(int sectionIndex) {
    // if (sectionIndex == 0) return currentIndex + 1;
    int order = 0;
    for (var s in sections) {
      order += s.lessons.length;
    }
    return order + 1;

    // return sections[sectionIndex].lessons.length + currentIndex + 1;
  }

  int countLessonOrder(int sectionIndex, int lessonIndex) {
    if (sectionIndex == 0) return lessonIndex + 1;
    int currentOrder = 0;
    for (int i = 0; i < sections.length - 1; i++) {
      currentOrder += sections[i].lessons.length;
    }
    return currentOrder + lessonIndex + 1;
  }

  int countCurrentSection() {
    int count = 0;
    for (int i = 0; i < sections.length; i++) {
      if (i == sections.length - 1) return count = i;
      if (sections[i + 1].lessons.isEmpty) return count = i;
    }
    return count;
  }

  @override
  void dispose() {
    category.dispose();
    title.dispose();
    description.dispose();
    // imageSource.dispose();

    super.dispose();
  }
}
