class PayoutResponse {
  final bool? success;
  final PayoutData? data;
  final String? message;
  final int? statusCode;
  final List<dynamic> errors;

  PayoutResponse({
    this.success,
    this.data,
    this.message,
    this.statusCode,
    this.errors = const [],
  });

  factory PayoutResponse.fromJson(Map<String, dynamic> json) {
    return PayoutResponse(
      success: json["success"],
      data: json["data"] != null ? PayoutData.fromJson(json["data"]) : null,
      message: json["message"],
      statusCode: json["status_code"],
      errors: List<dynamic>.from(json["errors"] ?? []),
    );
  }
}

class PayoutData {
  final int basicPayAmount;
  final int holidayPayAmount;
  final int withdrawCount;

  PayoutData({
    required this.basicPayAmount,
    required this.holidayPayAmount,
    required this.withdrawCount,
  });

  factory PayoutData.fromJson(Map<String, dynamic> json) {
    return PayoutData(
      basicPayAmount: json["basic_pay_amount"] ?? 0,
      holidayPayAmount: json["holiday_pay_amount"] ?? 0,
      withdrawCount: json["withdraw_count"] ?? 0,
    );
  }
}
