import 'package:intl/intl.dart';

class DateConvertissor {

  String convertDate(String string) {
    String start = "Il y a";
    print(string);
    String format = "yyyy-MM-dd HH:mm:ss.ZZZ";
    var formatting = DateFormat(format);
    DateTime dateTime = formatting.parse(string);
    if (dateTime == null) {
      return "Date inconnue";
    } else {
      var difference = DateTime.now().difference(dateTime);
      var days = difference.inDays;
      var hours = difference.inHours;
      var minutes = difference.inMinutes;
      print(dateTime);
      print(days);
      print(hours);
      print(minutes);

      if (days > 1) {
        return '$start $days jours';
      } else if (days == 1) {
        return '$start 1 jour';
      } else if (hours > 1) {
        return '$start $hours heures';
      } else if (hours == 1) {
        return '$start 1 heure';
      } else if (minutes > 1) {
        return '$start $minutes minutes';
      } else if (minutes <= 1) {
        return '$start 1 minute';
      } else {
        return "A l'instant";
      }
    }
  }
}