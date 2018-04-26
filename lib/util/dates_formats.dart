
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

class PrettyDateTime {
  DateTime dateTime;
  PrettyDateTime(DateTime dateTime) {
    this.dateTime = dateTime;
  }

  @override
  String toString() {
    if (this.dateTime == null){
      return "";
    }
    var dayOfWeek = TextConversions.daysOfWeek[this.dateTime.weekday];
    var monthName = TextConversions.monthNames[this.dateTime.month];
    var timeString = new LocalTime(this.dateTime).toString().padLeft(2, "0");

    var daySuffix =
        (dateTime.day == 1 || dateTime.day == 21 || dateTime.day == 31)
            ? "st"
            : (dateTime.day == 2 || dateTime.day == 22)
                ? "nd"
                : (dateTime.day == 3 || dateTime.day == 23) ? "rd" : "th";

    return "$timeString | $dayOfWeek, $monthName ${dateTime.day}$daySuffix ${dateTime.year}";
  }
}
