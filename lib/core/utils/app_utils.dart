import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppUtils {
  AppUtils._();

  static Color getColorFromHex(String hexColor) {
    final buffer = StringBuffer();
    if (hexColor.length == 6 || hexColor.length == 7) buffer.write('ff');
    buffer.write(hexColor.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static String formatCurrency(double amount, {String? currency}) {
    final numberFormat = NumberFormat.currency(
      locale: 'en_US',
      symbol: currency != null ? '$currency' : '',
      decimalDigits: 0,
    );
    return numberFormat.format(amount);
  }

  static String formatString(String amount, {String? currency}) {
    final numberFormat = NumberFormat.currency(
      locale: 'en_US',
      symbol: currency != null ? '$currency' : '',
      decimalDigits: 0,
    );
    final _amount = double.tryParse(amount) ?? 0;
    return numberFormat.format(_amount);
  }
}
