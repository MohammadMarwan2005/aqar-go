import 'package:intl/intl.dart'; // For date formatting

extension DateTimeHelper on DateTime {
  // Convert UTC to Amman (Jordan) Time Zone (UTC+3)
  DateTime toAmmanTime() {
    // Amman is UTC+3, so we add 3 hours to the UTC time
    return add(Duration(hours: 3));
  }

  // Convert UTC to device's local time
  DateTime toDeviceLocal() {
    return toLocal(); // Dart's built-in method to convert to device's local time
  }

  // Format date to "1/1/2022" format (adjust pattern as needed)
  String formatToShortDate() {
    final DateFormat dateFormat = DateFormat('d/M/yyyy');
    return dateFormat.format(this);
  }


  String formatToShortDateWithHour() {
    final DateFormat dateFormat = DateFormat('d/M/yyyy hh:mm a');
    return dateFormat.format(this);
  }

}
