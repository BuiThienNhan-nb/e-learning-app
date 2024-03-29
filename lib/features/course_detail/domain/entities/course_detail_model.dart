import 'package:e_learning_app/features/top/domain/entities/category_model.dart';
import 'package:e_learning_app/features/top/domain/entities/course_model.dart';

import '../../../../configs/formats.dart';
import '../../../auth/sign_in/domain/entities/teacher_model.dart';
import '../../../home/domain/entities/section_model.dart';

class CourseDetailModel extends CourseModel {
  final TeacherModel teacher;
  bool isEnrolled;

  CourseDetailModel({
    required CourseModel course,
    required this.teacher,
    required this.isEnrolled,
  }) : super(
          id: course.id,
          title: course.title,
          description: course.description,
          rates: course.rates,
          votes: course.votes,
          image: course.image,
          category: course.category,
          price: course.price,
          sale: course.sale,
          section: course.section,
          haveCertificate: course.haveCertificate,
          categories: course.categories,
        );

  @override
  CourseDetailModel copyWith({
    String? id,
    String? title,
    String? description,
    double? rates,
    int? votes,
    String? image,
    List<String>? category,
    double? price,
    double? sale,
    List<SectionModel>? section,
    TeacherModel? teacher,
    bool? isEnrolled,
    bool? haveCertificate,
    List<CategoryModel>? categories,
  }) {
    return CourseDetailModel(
      course: CourseModel(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        rates: rates ?? this.rates,
        votes: votes ?? this.votes,
        image: image ?? this.image,
        category: category ?? this.category,
        price: price ?? this.price,
        sale: sale ?? this.sale,
        section: section ?? this.section,
        haveCertificate: haveCertificate ?? this.haveCertificate,
        categories: categories ?? this.categories,
      ),
      teacher: teacher ?? this.teacher,
      isEnrolled: isEnrolled ?? this.isEnrolled,
    );
  }

  @override
  bool get stringify => true;

  @override
  double totalCourseHours() {
    int total = 0;
    for (var section in section) {
      for (var lesson in section.lessons) {
        total += lesson.length ?? 0;
      }
    }
    return (total / 60);
  }

  @override
  List<Object> get props {
    return [
      id,
      title,
      description,
      rates,
      AppFormats.instance.oCcy.format(votes),
      image ?? "",
      category,
      price,
      sale ?? 0,
      section,
      teacher,
      isEnrolled,
      haveCertificate,
      categories,
    ];
  }
}
