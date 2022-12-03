import 'package:e_learning_app/features/home/domain/entities/course_model.dart';

import '../../../../configs/formats.dart';
import '../../../auth/sign_in/domain/entities/image_model.dart';
import '../../../home/domain/entities/section_model.dart';

class CourseDetailModel extends CourseModel {
  final String teacherId;
  bool isPaid;

  CourseDetailModel({
    required CourseModel course,
    required this.teacherId,
    required this.isPaid,
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
        );

  @override
  CourseDetailModel copyWith({
    String? id,
    String? title,
    String? description,
    double? rates,
    int? votes,
    ImageModel? image,
    String? category,
    double? price,
    double? sale,
    List<SectionModel>? section,
    String? teacherId,
    bool? isPaid,
    bool? haveCertificate,
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
      ),
      teacherId: teacherId ?? this.teacherId,
      isPaid: isPaid ?? this.isPaid,
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
      image,
      category,
      price,
      sale ?? 0,
      section,
      teacherId,
      isPaid,
      haveCertificate,
    ];
  }
}
