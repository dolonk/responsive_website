class UrlValidator {
  // Email validation regex
  static final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  // Phone validation regex (international format)
  static final RegExp _phoneRegex = RegExp(r'^\+?[1-9]\d{1,14}$');

  /// Validate email address
  static bool isValidEmail(String email) {
    return _emailRegex.hasMatch(email.trim());
  }

  /// Validate phone number
  static bool isValidPhone(String phone) {
    final cleanPhone = phone.replaceAll(RegExp(r'[\s\-\(\)]'), '');
    return _phoneRegex.hasMatch(cleanPhone);
  }

  /// Validate URL format
  static bool isValidUrl(String url) {
    try {
      final uri = Uri.parse(url);
      return uri.hasScheme && uri.host.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  /// WhatsApp number validation (without + sign)
  static bool isValidWhatsAppNumber(String number) {
    final cleanNumber = number.replaceAll(RegExp(r'[\s\-\(\)\+]'), '');
    return RegExp(r'^\d{10,15}$').hasMatch(cleanNumber);
  }
}
