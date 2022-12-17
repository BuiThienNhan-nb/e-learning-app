import 'dart:math';

import 'package:injectable/injectable.dart';

import '../../features/auth/sign_in/domain/entities/image_model.dart';
import '../../features/home/domain/entities/course_model.dart';
import '../../features/home/domain/entities/lesson_model.dart';
import '../../features/home/domain/entities/section_model.dart';
import '../../main.dart';

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
  final List<String> _description = [
    """   We will extensively review Typography, color theory, layout and composition, how to use photos in design, photo manipulations and editing and magazine layout design, branding and logo design just to name a few. 
    We also learn the basics of Adobe Photoshop, illustrator and InDesign and do projects with real world applications. Every designer needs to know and master these programs and this course makes sure you know the essential tools to power through amazing projects. """,
    """   This course is an Introduction to Architecture. In this course we study the fundamental aspects that make up Architecture. Architecture is the science and art of the design and construction of buildings. In this course we study those fundamental aspects of Architecture with examples from a wide variety of architectural styles and historical periods. The course also serves as a doorway to the further study of the many styles and periods of human building design and construction activity and practice.
    I teach lecture courses and studios as I wish they would have been taught to me. Much of the graphic material in my lectures is taken or generated first hand directly by me on site. I teach to learn. I teach subjects as I wish they were taught to me. The Mission Statement. Education is a tool for the improvement of successive generations. I hear and I forget. I see and I remember. I do and I understand.""",
    """   Become a better business writer, and conduct yourself more professionally in your writing and interactions with your boss, clients, or co-workers - today and for the rest of your career.
    The course begins by focusing on business writing and specifically grammar. If you work in a professional environment, your clients and co-workers are all educated and know grammar well. Few things make you look less professional than poor grammar. 
    The course begins with simple written communication skills like grammar and writing correct and effective sentences that communicate their ideas.
    Once you gain solid grammar skills, the course will teach you slightly more advanced communication skills like writing email, instant messages, and day-to-day communication within your team.""",
    """   Public Speaking - You can come across as comfortable, confident, and relaxed when public speaking--even when facing tough questions or a crisis! Imagine knowing that you are going to deliver the exact message you want in every presentation. Careers are made and lost by both good and bad presentation performances. Why risk even one more day when you could be asked to speak to an audience without knowing how public speaking works?
    This course is also designed to help people with skills in the following areas: Selling with stories, Virtual Sales presentations, Pitching Yourself, Virtual interviewing, Remote selling and conducting consumer sales training masterclasses.""",
    """   There are countless courses on sales techniques. Mostly developed by trainers. This course is based on years' of personal-face-to-face experience from an expert who has worked at the coal face.
    Len Smith has many years' experience in sales & marketing with companies like IBM and has been associated with a number of start-up successes. Developing business and marketing plans, market research, product branding, VC funding and strategic business development.
    He's worked as a non-exec, involved in MBOs, company sales and a stock market flotation. He has also helped clients make the difficult leap from Europe to success in North America and the Asia Pacific Region.
    Clients have included IBM, Travelex, PricewaterhouseCoopers, Welcom, Marks & Spencer Financial Services and Manchester Business School.
    Now he shares his persuasion techniques with you.""",
    """   A complete writing system
    In this program, you won't get the usual “writing tips” you can find all over the internet and in other similar online programs. The four ingredients form the basis of a complete writing system designed to drive you to the summit of slick writing — very fast.
    The training may turn you into a confident author of blogs, books and business writing in as little as a few weeks. At the very least, you will understand how to infuse power and beauty into the soul of your writing to make it stand out dramatically.
    Whatever your writing ability now, you'll find yourself quickly transformed into an artistic composer of prose, whose copy sparkles with a rare sort of quality few people will understand, let alone be capable of emulating.""",
    """   This course begins with an overview of how to easily find the hottest CPA networks, and how to guarantee that you'll be accepted into the top networks every time.
    You'll dive into how to set up an effective and attractive website using WordPress so that you can get started using CPA (Cost Per Action) offers to begin making money.
    Knowing your market is crucial to a successful campaign, so you'll also tackle how to spy on your competitors and learn their secrets.
    Finally, to make the most of every CPA campaign, you'll learn how to design effective landing pages and squeeze pages.""",
    """   This passive income drop servicing online business or home business is the first course on Udemy that teaches you how to start to drop servicing online business or home business for passive income. This course will take you step by step from start to end to teach how to start a passive income drop servicing online business home business to make six figures per month.
    So in passive income drop servicing online business home business you create a website (I will teach you in this course step by step how to create a drop servicing website) and you showcase some services on that website for example video editing service, business card designing service, wedding card designing service or logo designing service, etcetera etcetera.
    I will highly recommend you to watch the first free preview lecture of this Passive income dropservice online business home business course and see how easy, interesting, and profitable is dropservicing online business home business for passive income.""",
  ];

  // Mock Lessons
  int _lessonOrder = 1;
  final List<String> _lesson1Title = [
    "Introducing basic building blocks of English grammar",
    "Conjunctions - these are an underrated, but very common parts of English grammar",
    "Formulas for correctly conjugating and punctuating complex sentences",
    "Exercise for testing run-on sentences - an important part of English grammar",
    "Run-on sentence exercise answers",
    "Hyphen rules - an important and tricky part of English grammar",
  ];
  final List<String> _lesson2Title = [
    "Example of a cover letter for a resume and a job application",
    "Basic business fonts to use in your business writing",
    "Business letters and resume cover letter exercise",
  ];

  final List<String> _lesson3Title = [
    "Writing a business report section introduction",
    "Recommendation section of the business report",
    "Writing the first business report",
    "Recommendation section of the business report",
    "Business report writing exercise",
  ];
  final List<String> _lesson4Title = [
    "Writing a business proposal - section introduction",
    "Advanced: Editing using emotional intelligence and understanding of your reader",
    "Researching your target reader for better and more targeted writing",
    "Writing the full solution part of the business proposal",
    "Contact information of your proposal",
    "Pricing slide of a business proposal",
    "Putting a lot of text on a proposal presentation page",
    "Business proposal exercise",
  ];
  final List<String> _lesson5Title = [
    "Section introduction to creating beautiful and professional presentations",
    "My evolution of bad designs",
    "Customizing our design",
    "Starting to create a pretty slide for informational slides in Google Slides",
    "How to make extra cool presentations that don't look like powerpoint",
    "Next level for your presentations - storytelling with images",
    "TEDx presentation guide",
  ];
  final List<String> _lesson6Title = [
    "Your professional headshot photo",
    "Course certificate: How to get it if you need it",
  ];

  late final List<List<LessonModel>> lessons = [
    _lesson1Title
        .map(
          (lessonTitle) => LessonModel(
            id: "id_${Random().nextInt(10)}_${Random().nextBool()}_${Random().nextInt(20)}",
            order: _lessonOrder++,
            title: lessonTitle,
            videoUrl: decodeYoutubeUrl,
            length: Random().nextInt(15),
          ),
        )
        .toList(),
    _lesson2Title
        .map(
          (lessonTitle) => LessonModel(
            id: "id_${Random().nextInt(10)}_${Random().nextBool()}_${Random().nextInt(20)}",
            order: _lessonOrder++,
            title: lessonTitle,
            videoUrl: decodeYoutubeUrl,
            length: Random().nextInt(15),
          ),
        )
        .toList(),
    _lesson3Title
        .map(
          (lessonTitle) => LessonModel(
            id: "id_${Random().nextInt(10)}_${Random().nextBool()}_${Random().nextInt(20)}",
            order: _lessonOrder++,
            title: lessonTitle,
            videoUrl: decodeYoutubeUrl,
            length: Random().nextInt(15),
          ),
        )
        .toList(),
    _lesson4Title
        .map(
          (lessonTitle) => LessonModel(
            id: "id_${Random().nextInt(10)}_${Random().nextBool()}_${Random().nextInt(20)}",
            order: _lessonOrder++,
            title: lessonTitle,
            videoUrl: decodeYoutubeUrl,
            length: Random().nextInt(15),
          ),
        )
        .toList(),
    _lesson5Title
        .map(
          (lessonTitle) => LessonModel(
            id: "id_${Random().nextInt(10)}_${Random().nextBool()}_${Random().nextInt(20)}",
            order: _lessonOrder++,
            title: lessonTitle,
            videoUrl: decodeYoutubeUrl,
            length: Random().nextInt(15),
          ),
        )
        .toList(),
    _lesson6Title
        .map(
          (lessonTitle) => LessonModel(
            id: "id_${Random().nextInt(10)}_${Random().nextBool()}_${Random().nextInt(20)}",
            order: _lessonOrder++,
            title: lessonTitle,
            videoUrl: decodeYoutubeUrl,
            length: Random().nextInt(15),
          ),
        )
        .toList(),
  ];

  // Mock sections
  final List<String> _sectionTitle = [
    "Basic grammar for business writing",
    "Writing business letter",
    "Write business report",
    "Write business proposal - advanced communication skill",
    "Create beautiful presentations",
    "Conclusion",
  ];
  int _sectionModelIndex = 0;
  late final List<SectionModel> sections = _sectionTitle
      .map(
        (sectionTitle) => SectionModel(
          id: "id_${Random().nextDouble()}",
          title: sectionTitle,
          lessons: lessons[_sectionModelIndex++],
        ),
      )
      .toList();

  int _lessonIndex = 0;
  late final List<CourseModel> recommendedLessons = _titles
      .map(
        (title) => CourseModel(
          id: "$_lessonIndex",
          title: title,
          description: _description[_lessonIndex],
          rates: (_random.nextInt(5) + _random.nextDouble()),
          votes: _random.nextInt(40000),
          image: _images[_lessonIndex].url,
          category: [_category[_lessonIndex++]],
          price: _random.nextDouble() * 100,
          sale: _random.nextBool() ? _random.nextDouble() : null,
          section: sections,
          haveCertificate: Random().nextBool(),
        ),
      )
      .toList();
}
