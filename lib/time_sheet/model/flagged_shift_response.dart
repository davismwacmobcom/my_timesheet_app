
class FlaggedShiftListResponse {
  final bool success;
  final FlaggedShiftListData data;
  final String message;
  final int statusCode;
  final List<dynamic> errors;

  FlaggedShiftListResponse({
    required this.success,
    required this.data,
    required this.message,
    required this.statusCode,
    required this.errors,
  });

  factory FlaggedShiftListResponse.fromJson(Map<String, dynamic> json) {
    return FlaggedShiftListResponse(
      success: json["success"],
      data: FlaggedShiftListData.fromJson(json["data"]),
      message: json["message"],
      statusCode: json["status_code"],
      errors: json["errors"],
    );
  }
}

class FlaggedShiftListData {
  final List<WeekData> data;
  final double totalPayRate;
  final int totalCount;
  final int perPage;
  final int currentPage;

  FlaggedShiftListData({
    required this.data,
    required this.totalPayRate,
    required this.totalCount,
    required this.perPage,
    required this.currentPage,
  });

  factory FlaggedShiftListData.fromJson(Map<String, dynamic> json) {
    return FlaggedShiftListData(
      data: (json["data"] as List).map((e) => WeekData.fromJson(e)).toList(),
      totalPayRate: json["total_pay_rate"].toDouble(),
      totalCount: json["total_count"],
      perPage: json["per_page"],
      currentPage: json["current_page"],
    );
  }
}

class WeekData {
  final String week;
  final String weekId;
  final List<ShiftFlagged> shifts;

  WeekData({
    required this.week,
    required this.weekId,
    required this.shifts,
  });

  factory WeekData.fromJson(Map<String, dynamic> json) {
    return WeekData(
      week: json["week"],
      weekId: json["week_id"],
      shifts: (json["shifts"] as List).map((e) => ShiftFlagged.fromJson(e)).toList(),
    );
  }
}

class ShiftFlagged {
  final String id;
  final String date;
  final String shiftCode;
  final Client client;
  final double totalPayRate;
  final double totalWorkedHours;
  final String shiftTiming;
  final int hourlyRate;
  final int status;
  final String? expectedDate;
  final int? checkoutType;
  final bool getApproval;
  final String? disputeReason;

  ShiftFlagged({
    required this.id,
    required this.date,
    required this.shiftCode,
    required this.client,
    required this.totalPayRate,
    required this.totalWorkedHours,
    required this.shiftTiming,
    required this.hourlyRate,
    required this.status,
    required this.expectedDate,
    required this.checkoutType,
    required this.getApproval,
    required this.disputeReason,
  });

  factory ShiftFlagged.fromJson(Map<String, dynamic> json) {
    return ShiftFlagged(
      id: json["id"],
      date: json["date"],
      shiftCode: json["shift_code"],
      client: Client.fromJson(json["client"]),
      totalPayRate: json["total_pay_rate"].toDouble(),
      totalWorkedHours: json["total_worked_hours"].toDouble(),
      shiftTiming: json["shift_timing"],
      hourlyRate: json["hourly_rate"],
      status: json["status"],
      expectedDate: json["expected_date"],
      checkoutType: json["checkout_type"],
      getApproval: json["get_approval"] ?? false,
      disputeReason: json["dispute_reason"],
    );
  }
}

class Client {
  final String id;
  final String name;
  final String? address;
  final int checkInDistance;
  final Location location;
  final County county;
  final String? photo;
  final List<dynamic> preference;
  final int type;
  final RegionalManager? regionalManager;
  final String? sdrEmail;
  final int breakTimePayment;

  Client({
    required this.id,
    required this.name,
    required this.address,
    required this.checkInDistance,
    required this.location,
    required this.county,
    required this.photo,
    required this.preference,
    required this.type,
    required this.regionalManager,
    required this.sdrEmail,
    required this.breakTimePayment,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json["id"],
      name: json["name"],
      address: json["address"],
      checkInDistance: json["check_in_distance"],
      location: Location.fromJson(json["location"]),
      county: County.fromJson(json["county"]),
      photo: json["photo"],
      preference: json["preference"],
      type: json["type"],
      regionalManager: json["regional_manager"] != null
          ? RegionalManager.fromJson(json["regional_manager"])
          : null,
      sdrEmail: json["sdr_email"],
      breakTimePayment: json["break_time_payment"],
    );
  }
}

class Location {
  final String type;
  final List<double> coordinates;

  Location({
    required this.type,
    required this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      type: json["type"],
      coordinates: (json["coordinates"] as List)
          .map((e) => e.toDouble())
          .toList()
          .cast<double>(), // Ensures the list is of type List<double>
    );
  }
}

class County {
  final String id;
  final String name;

  County({
    required this.id,
    required this.name,
  });

  factory County.fromJson(Map<String, dynamic> json) {
    return County(
      id: json["id"],
      name: json["name"],
    );
  }
}

class RegionalManager {
  final String id;
  final String name;

  RegionalManager({
    required this.id,
    required this.name,
  });

  factory RegionalManager.fromJson(Map<String, dynamic> json) {
    return RegionalManager(
      id: json["id"],
      name: json["name"],
    );
  }
}
