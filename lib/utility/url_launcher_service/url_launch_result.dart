class UrlLaunchResult {
  final bool success;
  final String? errorMessage;
  final UrlType urlType;

  const UrlLaunchResult({required this.success, this.errorMessage, required this.urlType});

  factory UrlLaunchResult.success(UrlType type) {
    return UrlLaunchResult(success: true, urlType: type);
  }

  factory UrlLaunchResult.failure(UrlType type, String error) {
    return UrlLaunchResult(success: false, errorMessage: error, urlType: type);
  }
}

/// URL type enum for better type safety
enum UrlType { website, email, phone, sms, whatsapp, telegram, other }
