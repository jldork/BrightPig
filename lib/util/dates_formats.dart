abstract class TextConversions {
  static final Map<int, String> monthAbbrev = {
    1: "Jan",
    2: "Feb",
    3: "Mar",
    4: "Apr",
    5: "May",
    6: "Jun",
    7: "Jul",
    8: "Aug",
    9: "Sep",
    10: "Oct",
    11: "Nov",
    12: "Dec"
  };

  static final Map<int, String> daysOfWeek = {
    DateTime.MONDAY: "Monday",
    DateTime.TUESDAY: "Tuesday",
    DateTime.WEDNESDAY: "Wednesday",
    DateTime.THURSDAY: "Thursday",
    DateTime.FRIDAY: "Friday",
    DateTime.SATURDAY: "Saturday",
    DateTime.SUNDAY: "Sunday"
  };

  static final Map<int, String> monthNames = {
    1: "January",
    2: "Febuary",
    3: "March",
    4: "April",
    5: "May",
    6: "June",
    7: "July",
    8: "Augut",
    9: "September",
    10: "Octpber",
    11: "November",
    12: "December"
  };
}

class LocalTime {
  DateTime dateTime;

  LocalTime(DateTime dateTime) {
    this.dateTime = dateTime;
  }

  @override
  String toString() {
    var local = this.dateTime.toLocal();
    var hour = local.hour % 13;
    var suffix = local.hour > 12 ? "PM" : "AM";
    return "$hour:${local.minute} $suffix";
  }
}

String datetimeToString(dateTime) {
  if (dateTime == null) {
    return "";
  }
  String dayOfWeek = TextConversions.daysOfWeek[dateTime.weekday];
  String monthName = TextConversions.monthNames[dateTime.month];
  DateTime localTime = new LocalTime(dateTime).dateTime;
  String minutestring = localTime.minute < 10 ? "0${localTime.minute}": "${localTime.minute}";
  
  String meridiem = localTime.hour < 12 ? "AM" : "PM";
  String timeString = "${localTime.hour % 12}:$minutestring $meridiem";
   

  Map<int, String> suffixes = {1: "st", 2: "nd", 3: "rd"};

  int remainder = dateTime.day % 10;
  String daySuffix = [1, 2, 3].contains(remainder) ? suffixes[remainder] : "th";

  return "$timeString | $dayOfWeek, $monthName ${dateTime.day}$daySuffix ${dateTime.year}";
}
