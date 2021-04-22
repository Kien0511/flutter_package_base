import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toDateString({String pattern = "yyyy年M月d日"}) {
    return DateFormat(pattern).format(this);
  }

  String toTimeString({String pattern = "HH:mm"}) {
    return DateFormat(pattern).format(this);
  }

  bool isBetween(DateTime start, DateTime end) {
    if (start == null || end == null) return false;

    return this.toStartMoment().millisecondsSinceEpoch >= start.toStartMoment().millisecondsSinceEpoch && this.toStartMoment().millisecondsSinceEpoch <= end.toEndMoment().millisecondsSinceEpoch;
  }

  bool isSameDay(DateTime date) {
    if (date == null) return false;

    return date.day == this.day && date.month == this.month && date.year == this.year;
  }

  DateTime toStartMoment() {
    return DateTime(this.year, this.month, this.day);
  }

  DateTime toEndMoment() {
    return DateTime(this.year, this.month, this.day, 23, 59, 59);
  }

  DateTime toFirstDayOfMonth() {
    return DateTime(this.year, this.month, 1);
  }
  
  DateTime toBeforeDate() {
    return DateTime(this.year, this.month, this.day - 1);
  }

  DateTime toLastDayOfMonth() {
    return DateTime(this.year, this.month, this.dayCountOfMonth());
  }

  bool isSameYear(DateTime dateTime){
    return this.year == dateTime.year;
  }

  int dayCountOfMonth() {
    switch(this.month) {
      case 1:
      case 3:
      case 5:
      case 7:
      case 8:
      case 10:
      case 12:
        return 31;

      case 2:
        return this.year%4 == 0 ? 29 : 28;

      default:
        return 30;
    }
  }

  DateTime getMax(DateTime dateTime) {
    if (this != null && dateTime != null) {
      if(this.millisecondsSinceEpoch >= dateTime.millisecondsSinceEpoch) {
        return this;
      } else {
        return dateTime;
      }
    } else if(this == null && dateTime != null) {
      return dateTime;
    }
    return this;
  }

  String getTimeToNow({String minuteAgo = "分前", String dayAgo = "日前"}) {
    DateTime now = DateTime.now();

    var nowInMillis = now.millisecondsSinceEpoch;
    var dateInMillis  = this.millisecondsSinceEpoch;

    if (dateInMillis >= nowInMillis) {
      return 0.toString() + minuteAgo;
    }

    var differenceTimeDuration = Duration(milliseconds: nowInMillis - dateInMillis);

    var diffInMin = differenceTimeDuration.inMinutes;
    if (diffInMin >= 0 && diffInMin < 60) {
      return diffInMin.toString() + minuteAgo;
    }

    var diffInHour = differenceTimeDuration.inHours;
    if (diffInHour >= 0 && diffInHour < 24) {
      return diffInHour.toString() + minuteAgo;
    }

    var diffInDays = differenceTimeDuration.inDays;
    if (diffInDays >= 0 && diffInDays <= 30) {
      return diffInDays.toString() + dayAgo;
    }

    return this.toDateString();
  }
}
