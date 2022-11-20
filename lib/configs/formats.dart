import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class AppFormats {
  AppFormats._internal();

  static AppFormats instance = AppFormats._internal();

  factory AppFormats() {
    return instance;
  }

  final DateFormat formatDay = DateFormat('dd/MM/yyyy');

  final DateFormat formatTime = DateFormat('HH:mm');

  final DateFormat formatDateTime = DateFormat('dd/MM/yyyy -- HH:mm');

  final DateFormat formatTimeAndDate = DateFormat('HH:mm MM/dd');

  final DateFormat formatDateMonthTime = DateFormat('MMM dd yyyy | HH:mm:ss');

  final NumberFormat oCcy = NumberFormat("#,##0", "en_US");

  String timeAgo(DateTime time) => timeago.format(time);
}
