import 'dart:math';

import 'package:injectable/injectable.dart';

import '../../features/auth/sign_in/domain/entities/image_model.dart';
import '../../features/home/domain/entities/course_model.dart';

@lazySingleton
class MockCourses {
  final _random = Random();

  // Mock Lesson Model
  final List<ImageModel> _images = [
    const ImageModel(
      url:
          "https://images.unsplash.com/photo-1612180341933-aedf0a8c7315?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1110&q=80",
      blurHash: "LJIE;GoJFytR~WoeD*R*yEofslM{",
    ),
    const ImageModel(
      url:
          "https://images.unsplash.com/photo-1487958449943-2429e8be8625?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      blurHash: "LTNwvQE2xvIV~qa~D*ofD%M{IV%2",
    ),
    const ImageModel(
      url:
          "https://images.unsplash.com/photo-1634992278141-905a73b9d799?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80",
      blurHash: "L6Du;]^%DlTw00Io%1i_00XT~Umm",
    ),
    const ImageModel(
      url:
          "https://images.unsplash.com/photo-1558541966-d1071f7329bd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1333&q=80",
      blurHash: "L03[xTD%00~qD%xuM{9FIU%M-;4n",
    ),
    const ImageModel(
      url:
          "https://images.unsplash.com/photo-1543286386-713bdd548da4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      blurHash: "LLF5,CRO4TskIV%MM_t700Ip_NIo",
    ),
    const ImageModel(
      url:
          "https://images.unsplash.com/photo-1586380951230-e6703d9f6833?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      blurHash: "L9Hxj9?^jE-=J7?b_2x]00tS.8t7",
    ),
    const ImageModel(
      url:
          "https://images.unsplash.com/photo-1555077292-22a4489e5897?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      blurHash: "L6FX^k}n0fIA8wt7E4x]0Bof?bxa",
    ),
    const ImageModel(
      url:
          "https://images.unsplash.com/photo-1586880244406-556ebe35f282?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      blurHash: "LGJa=s009F%N~ox]00%M?E4otRM{",
    ),
  ];
  final List<String> _category = [
    "3D Design",
    "Architecture",
    "Grammar",
    "Speaking",
    "Sales",
    "Writing",
    "Digital Marketing",
    "Business",
  ];
  final List<String> _titles = [
    "3D Design Illustrations class (2022 updated)",
    "Introduction to Architecture!",
    "Business Communication Skills: Business Writing & Grammar",
    "2022 Complete Public Speaking Masterclass For Every Occasion",
    "Sales and Persuasion Skills for Startups",
    "Writing With Flair: How To Become An Exceptional Writer",
    "The Complete CPA Marketing Course",
    "Passive Income 6 figures Drop Servicing Home Online Business",
  ];
  int _lessonIndex = 0;

/*
  late final List<LessonModel> _recommendedLessons = [
    LessonModel(
      id: "${_lessonIndex++}",
      title: "3D Design Illustrations class (2022 updated)",
      description: "description",
      rates: (_random.nextInt(5) + _random.nextDouble()),
      votes: _random.nextInt(40000),
      image: const ImageModel(
        url:
            "https://images.unsplash.com/photo-1666688090267-4858c2075629?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
        blurHash: "LUE{|Z~qNeIV0LE2WAozIpR+t6oI",
      ),
      category: _category[_random.nextInt(_category.length)],
      price: _random.nextDouble() * 100,
      sale: _random.nextBool() ? _random.nextDouble() : null,
    ),
    LessonModel(
      id: "${_lessonIndex++}",
      title: "Learning with your own way!",
      description: "description",
      rates: (_random.nextInt(5) + _random.nextDouble()),
      votes: _random.nextInt(40000),
      image: _images[_random.nextInt(_images.length)],
      category: _category[_random.nextInt(_images.length)],
      price: _random.nextDouble() * 100,
      sale: _random.nextBool() ? _random.nextDouble() : null,
    ),
    LessonModel(
      id: "${_lessonIndex++}",
      title: "How does it work?",
      description: "description",
      rates: (_random.nextInt(5) + _random.nextDouble()),
      votes: _random.nextInt(40000),
      image: _images[_random.nextInt(_images.length)],
      category: _category[_random.nextInt(_images.length)],
      price: _random.nextDouble() * 100,
      sale: _random.nextBool() ? _random.nextDouble() : null,
    ),
    LessonModel(
      id: "${_lessonIndex++}",
      title: "Join us to improve your skills",
      description: "description",
      rates: (_random.nextInt(5) + _random.nextDouble()),
      votes: _random.nextInt(40000),
      image: _images[_random.nextInt(_images.length)],
      category: _category[_random.nextInt(_images.length)],
      price: _random.nextDouble() * 100,
      sale: _random.nextBool() ? _random.nextDouble() : null,
    ),
    LessonModel(
      id: "${_lessonIndex++}",
      title: "Speak like native",
      description: "description",
      rates: (_random.nextInt(5) + _random.nextDouble()),
      votes: _random.nextInt(40000),
      image: _images[_random.nextInt(_images.length)],
      category: _category[_random.nextInt(_images.length)],
      price: _random.nextDouble() * 100,
      sale: _random.nextBool() ? _random.nextDouble() : null,
    ),
    LessonModel(
      id: "${_lessonIndex++}",
      title: "Making money...",
      description: "description",
      rates: (_random.nextInt(5) + _random.nextDouble()),
      votes: _random.nextInt(40000),
      image: _images[_random.nextInt(_images.length)],
      category: _category[_random.nextInt(_images.length)],
      price: _random.nextDouble() * 100,
      sale: _random.nextBool() ? _random.nextDouble() : null,
    ),
  ];
  */

  late final List<CourseModel> recommendedLessons = _titles
      .map(
        (title) => CourseModel(
          id: "$_lessonIndex",
          title: title,
          description: "description",
          rates: (_random.nextInt(5) + _random.nextDouble()),
          votes: _random.nextInt(40000),
          image: _images[_lessonIndex],
          category: _category[_lessonIndex++],
          price: _random.nextDouble() * 100,
          sale: _random.nextBool() ? _random.nextDouble() : null,
        ),
      )
      .toList();
}
