import 'package:flutter_test/flutter_test.dart';
import '../lib/util/dates_formats.dart';

void main() {
  test('Can convert datetime to string', () {
    final testDate = new DateTime(2018, 5,19, 10, 0,0);
    final expectedString = "10:00 AM | Saturday, May 19th 2018";
    expect(datetimeToString(testDate),equals(expectedString));

    final testDate2 = new DateTime(2018, 5,1, 10, 1,0);
    final expectedString2 = "10:01 AM | Tuesday, May 1st 2018";
    expect(datetimeToString(testDate2),equals(expectedString2));

    final testDate3 = new DateTime(2018, 5,1, 17, 14,0);
    final expectedString3 = "5:14 PM | Tuesday, May 1st 2018";
    expect(datetimeToString(testDate3),equals(expectedString3));
  });
}
