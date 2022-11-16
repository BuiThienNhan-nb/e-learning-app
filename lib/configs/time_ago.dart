// import 'package:intl/intl.dart';

// class GetTimeAgo {
//   String getTimeAgo(DateTime dateTime, String? pattern) {
//     final String convertPattern = pattern ?? "dd MMM, yyyy hh:mm aa";
//     final String date = DateFormat(convertPattern).format(dateTime);
//     var currentClock = DateTime.now();
//     var elapsed =
//         (currentClock.millisecondsSinceEpoch - dateTime.millisecondsSinceEpoch)
//             .abs();

//     final num seconds = elapsed / 1000;
//     final num minutes = seconds / 60;
//     final num hours = minutes / 60;
//     final num days = hours / 24;
//     final num weeks = days / 7;

//     String result;

//     /// If [elapsed] is less than 1 minute.
//     if (seconds < 59) {
//       return "${seconds.round()} seconds ago";
//     }

//     /// If [elapsed] is less than 2 minutes and
//     /// greater than 1 minute.
//     else if (seconds < 119) {
//       return "${minutes.round()} minutes ago";
//     }

//     /// If [elapsed] is less than 1 hour and
//     /// greater than 2 minutes.
//     else if (minutes < 59) {
//       return "${minutes.round()} minutes ago";
//     }

//     /// If [elapsed] is less than 2 hours and
//     /// greater than 1 hour.
//     else if (minutes < 119) {
//       return "${hours.round()} hours ago";
//     }

//     /// If [elapsed] is less than 24 hours and
//     /// greater than 2 hours.
//     else if (hours < 24) {
//       return "${hours.round()} hours ago";
//     }

//     /// If [elapsed] is less than 2 days and
//     /// greater than 24 hours.
//     else if (hours < 48) {
//       return "${hours.round()} hours ago";
//     }

//     /// If [elapsed] is less than 8 days and
//     /// greater than 1 day.
//     else if (days < 8) {
//       return "${days.round()} days ago";
//     }

//     /// If [elapsed] is greater than 8 days,
//     /// a formatted [Date] will be returned.
//     else {
//       msg = date;
//       result = date;
//     }

//     return result;
//   }
// }
