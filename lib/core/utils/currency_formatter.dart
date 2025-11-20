// lib/core/utils/currency_formatter.dart
import 'package:intl/intl.dart';

class CurrencyFormatter {
  static final Map<String, NumberFormat> _formatters = {};

  /// Format amount with currency symbol
  static String format(double amount, String currencyCode) {
    // Get or create formatter for this currency
    final formatter = _getFormatter(currencyCode);
    return formatter.format(amount);
  }

  /// Format amount without currency symbol
  static String formatAmount(double amount, String currencyCode) {
    final formatter = _getAmountFormatter(currencyCode);
    return formatter.format(amount);
  }

  /// Legacy method for backward compatibility
  static String formatLegacy(double amount) {
    return format(amount, 'LKR');
  }

  static String formatCompact(double amount) {
    if (amount >= 1000000) {
      return 'Rs. ${(amount / 1000000).toStringAsFixed(1)}M';
    } else if (amount >= 1000) {
      return 'Rs. ${(amount / 1000).toStringAsFixed(1)}K';
    } else {
      return formatLegacy(amount);
    }
  }

  /// Get number formatter with currency symbol
  static NumberFormat _getFormatter(String currencyCode) {
    if (!_formatters.containsKey(currencyCode)) {
      _formatters[currencyCode] = NumberFormat.currency(
        symbol: _getCurrencySymbol(currencyCode),
        decimalDigits: _getDecimalDigits(currencyCode),
      );
    }
    return _formatters[currencyCode]!;
  }

  /// Get number formatter without currency symbol
  static NumberFormat _getAmountFormatter(String currencyCode) {
    final key = '${currencyCode}_amount';
    if (!_formatters.containsKey(key)) {
      _formatters[key] = NumberFormat(
        '#,##0.${'0' * _getDecimalDigits(currencyCode)}',
      );
    }
    return _formatters[key]!;
  }

  /// Get currency symbol for currency code
  static String _getCurrencySymbol(String currencyCode) {
    switch (currencyCode.toUpperCase()) {
      case 'LKR':
        return 'Rs. ';
      case 'USD':
        return '\$';
      case 'EUR':
        return '€';
      case 'GBP':
        return '£';
      case 'JPY':
        return '¥';
      case 'INR':
        return '₹';
      case 'CNY':
        return '¥';
      default:
        return '$currencyCode ';
    }
  }

  /// Get decimal digits for currency
  static int _getDecimalDigits(String currencyCode) {
    switch (currencyCode.toUpperCase()) {
      case 'JPY':
      case 'KRW':
        return 0; // These currencies don't use decimal places
      default:
        return 2;
    }
  }

  /// Parse string to double (removes currency symbols and formatting)
  static double? parseAmount(String amountString) {
    // Remove all non-numeric characters except decimal point and minus sign
    final cleanString = amountString.replaceAll(RegExp(r'[^\d.-]'), '');
    return double.tryParse(cleanString);
  }

  /// Format discount percentage
  static String formatDiscount(double originalPrice, double salePrice) {
    if (originalPrice <= salePrice) return '';

    final discount = ((originalPrice - salePrice) / originalPrice) * 100;
    return '${discount.round()}% OFF';
  }
}
