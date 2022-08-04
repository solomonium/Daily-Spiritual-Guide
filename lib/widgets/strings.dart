import 'package:intl/intl.dart';
import 'package:validators/validators.dart';

class StringUtil {
  static final compactCurrencyFormat =
      NumberFormat.compactLong(locale: "en_US");
  static final currencyFormat = NumberFormat.currency(locale: "en_NG");
  static final nairaFormat =
      NumberFormat.currency(locale: "en_NG", symbol: "₦");

  static bool isPhone(value) => matches(value, r'^(\+?234|0)?[789]\d{9}$');
}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${substring(1)}';
  String get allInCaps => toUpperCase();
  String get capitalize => split(" ").map((str) => str.inCaps).join(" ");
}

extension DecimalPlaces on num {
  String get zeroPlaces => toStringAsFixed(0);
  String toDecimalPlaces(int fractionDigits) {
    return toStringAsFixed(fractionDigits);
  }
}

extension MoneyExtension on String {
  String get stripLocale => substring(3);
}
