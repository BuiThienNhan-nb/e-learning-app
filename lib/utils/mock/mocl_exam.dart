import 'package:injectable/injectable.dart';

import '../../features/create_exam/domain/entities/exam_model.dart';
import '../../features/create_exam/domain/entities/question_model.dart';

@injectable
class MockExam {
  ExamModel exam = ExamModel(
    lessonId: "lessonId",
    lessonTitle: "lessonTitle",
    examTitle: "Le 1.2 exam",
    userId: "userId",
    time: 1,
    questions: [
      QuestionModel(
        id: "1",
        title: "3 + 5 =",
        options: const ["5", "6", "7", "8"],
        answer: "8",
      ),
      QuestionModel(
        id: "2",
        title: "2 + 9 =",
        options: const ["11", "12", "13", "14"],
        answer: "11",
      ),
      QuestionModel(
        id: "3",
        title: "7 + 2 =",
        options: const ["8", "9", "10", "11"],
        answer: "9",
      ),
    ],
  );
}
