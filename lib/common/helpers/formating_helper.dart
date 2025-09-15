import 'package:intl/intl.dart';

extension FormatingHelper on int {
  /// Formats the double with thousand separators (e.g. 2000 -> 2,000)
  /// Optionally allows specifying decimal digits.
  String formatWithCommas({int decimalDigits = 0}) {
    final formatter = NumberFormat.decimalPattern()
      ..minimumFractionDigits = decimalDigits
      ..maximumFractionDigits = decimalDigits;
    return formatter.format(this);
  }
}

extension NullableDoubleFormatting on int? {
  /// Safe formatting for nullable doubles
  String formatWithCommas({int decimalDigits = 0}) {
    if (this == null) return '';
    return (this!).formatWithCommas(decimalDigits: decimalDigits);
  }
}
