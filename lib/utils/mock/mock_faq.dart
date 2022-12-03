import 'package:e_learning_app/features/settings/domain/entities/faq_model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class MockFAQ {
  final List<String> questions = [
    "What do E-learning courses include?",
    "How do I take a E-learning course?",
    "Do I have to start my E-learning course at a certain time? And how long do I have to complete it?",
    "Is E-learning an accredited institution? Do I receive anything after I complete a course?",
    "What if I don’t like a course I purchased?",
    "Our Payment method",
    "How to troubleshoot payment failures?",
    "Important note regarding VPN use",
  ];
  final List<String> answers = [
    "Each Udemy course is created, owned and managed by the instructor(s). The foundation of each Udemy course are its lectures, which can include videos, slides, and text. In addition, instructors can add resources and various types of practice activities, as a way to enhance the learning experience of students.",
    """Udemy courses are entirely on-demand and they can be accessed from several different devices and platforms, including a desktop, laptop, and our mobile app. 
After you enroll in a course, you can access it by clicking on the course link you will receive in your confirmation email (provided you’re logged into your Udemy account). You can also begin the course by logging in and navigating to your My learning page.""",
    "There are no deadlines to begin or complete a course.",
    "While Udemy is not an accredited institution, we offer skills-based courses taught by real-world experts in their field. Every approved, paid course features a certificate of completion to document your accomplishment.",
    "We want you to be satisfied, so all eligible courses purchased on Udemy can be refunded within 30 days. If you are unhappy with a course, you can request a refund, provided the request meets the guidelines in our refund policy.",
    """Depending on your device, location, and what country your Udemy account is registered in, your payment options may include the following:
Apple App Store and Google Play.
Buy now, pay later: Eligible students in the United States can purchase on Udemy using the buy now, pay later options.
Cash Payments and Bank Transfers may be an option for students in several different Latin American nations, as well as some countries in Europe and Asia.
International Credit And Debit Cards: we accept most major international credit and debit cards like Visa, MasterCard, American Express, JCB and Discover.
PayPal is a supported method of payment for Udemy courses in most countries.""",
    """1. Double check that you’re entering the correct details for your payment method and that your card is up-to-date (additional tips on how to do this are available below).
2. If you’re still receiving an error message that the payment could not be completed, please contact your bank.""",
    "If you're using a VPN while attempting to make a purchase, please note that multiple IP addresses can result in authorization problems and failed transactions. We advise that you refrain from using a virtual private network (VPN) while making a purchase on Udemy.",
  ];
  int index = 0;

  late final List<FAQModel> faqs = questions
      .map(
        (e) => FAQModel(
          id: "faq_id_$index",
          question: e,
          description: answers[index++],
        ),
      )
      .toList();
}
