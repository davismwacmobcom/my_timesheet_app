class AppConstants {
  //![--------------------------{DEVELOPMENT ENVIRONMENT}----------------------]

  //----------------------------AUTH BASE URL----------------------------------//
  static const String authBaseUrl = "https://auth-xpresshealth.webc.in";

  //----------------------------AUTH API KEY-----------------------------------//
  static const String authApiKey =
      "VVRCR1UxTlZTbEJXVmpWWER2DFqGHZFRWVTVHV0RCR1VWTldPVlZVTUhSR1ZHYzlQUT09AU";

  //----------------------------USER BASE URL----------------------------------//
  static const String userBaseUrl = "https://user-xpresshealth.webc.in";

  //----------------------------USER API KEY-----------------------------------//
  static const String userApiKey =
      "TER34FCVJGU1NVSlBWVjlEVDBaR1JTYHJ87UI9JGHJUdTVU5GWDBGUVNWOVVUMHRGVGc9US";

  //![--------------------------{QA TESTING ENVIRONMENT}-----------------------]

  //----------------------------AUTH QA BASE URL-------------------------------//
  //static const String authQaBaseUrl = "https://qa.auth-xpresshealth.webc.in";
  static const String authQaBaseUrl = "https://run.mocky.io";

  //----------------------------AUTH QA API KEY--------------------------------//
  static const String authQaApiKey =
      "VVRCR1UxTlZTbEJXVmpWWER2DFqGHZFRWVTVHV0RCR1VWTldPVlZVTUhSR1ZHYzlQUT09AU";

  //----------------------------USER QA BASE URL-------------------------------//
  //static const String userQaBaseUrl = "https://qa.user-xpresshealth.webc.in";
  static const String userQaBaseUrl = "https://run.mocky.io";

  //----------------------------USER QA API KEY--------------------------------//
  static const String userQaApiKey =
      "TER34FCVJGU1NVSlBWVjlEVDBaR1JTYHJ87UI9JGHJUdTVU5GWDBGUVNWOVVUMHRGVGc9US";

  //![--------------------------{UAT TESTING ENVIRONMENT}-----------------------]

  //----------------------------AUTH UAT BASE URL-------------------------------//
  static const String authUatBaseUrl = "https://uat.auth-xpresshealth.webc.in";

  //----------------------------AUTH UAT API KEY--------------------------------//
  static const String authUatApiKey =
      "VVRCR1UxTlZTbEJXVmpWWER2DFqGHZFRWVTVHV0RCR1VWTldPVlZVTUhSR1ZHYzlQUT09AU";

  //----------------------------USER UAT BASE URL-------------------------------//
  static const String userUatBaseUrl = "https://uat.user-xpresshealth.webc.in";

  //----------------------------USER UAT API KEY--------------------------------//
  static const String userUatApiKey =
      "TER34FCVJGU1NVSlBWVjlEVDBaR1JTYHJ87UI9JGHJUdTVU5GWDBGUVNWOVVUMHRGVGc9US";

  //![--------------------------{BETA TESTING ENVIRONMENT}-----------------------]

  //----------------------------AUTH BETA BASE URL-------------------------------//
  static const String authBetaBaseUrl =
      "https://beta-auth.xpresshealth.webc.in";

  //----------------------------AUTH BETA API KEY--------------------------------//
  static const String authBetaApiKey = "AMCASHNR4515pmJPhKzeRjeeFbnJsn156GH";

  //----------------------------USER BETA BASE URL-------------------------------//
  static const String userBetaBaseUrl =
      "https://beta-user.xpresshealth.webc.in";

  //----------------------------USER BETA API KEY--------------------------------//
  static const String userBetaApiKey = "SMACAjRfBn1265JosphNRmlJisNFen126H";

  //![--------------------------{PROD  ENVIRONMENT}-----------------------]

  //----------------------------AUTH BETA BASE URL-------------------------------//
  static const String authProdBaseUrl = "https://auth.xpresshealthapp.com";

  //----------------------------AUTH BETA API KEY--------------------------------//
  static const String authProdApiKey = "AMCASHNR4515pmJPhKzeRjeeFbnJsn156GH";

  //----------------------------USER BETA BASE URL-------------------------------//
  static const String userProdBaseUrl = "https://user.xpresshealthapp.com";

  //----------------------------USER BETA API KEY--------------------------------//
  static const String userProdApiKey = "SMACAjRfBn1265JosphNRmlJisNFen126H";

  // KYC Configuration constants
  static const String kycClientId =
      "1ecc0528488d916901a6653fa2d26b536b4b6945034bd11532f129e108ceb610";
  static const String kycSecretKey = "cgqL5Nh2g4KVLqPrCfSSq34kg5x3d29a";

  // Fresh Chat Configuration constants
  static const String freshAppId = "54c387ed-518a-4274-8166-5623070cb6d2";
  static const String freshChatAppKey = "06479ea1-adf5-484d-a4c6-389872723a26";
  static const String freshChatDomain = "msdk.in.freshchat.com";

  static bool checkInTimeExist = false;

  static String accessToken = "";
  static int? profileCompletedStatus;
  static String staffID = "";
  static String tokenType = "";
  static bool showSkipAppUpdate = false;
  static String countryCode = "ie";

  static String currentRoute = '';

  static String version = "v1";
  static String prefix = "/api/staff";

  static String login = "$prefix/login";
  static String logOut = "$prefix/logout";
  static String sentOtp = "$prefix/forgot-password";
  static String verifyOtp = "$prefix/verify-email-otp";
  static String resetPassword = "$prefix/change-password";
  static String getStaffBasicData = "$prefix/basic-data";
  static String registerXpressStaff = "$prefix/signup";
  static String getShiftList = "$prefix/shifts/available-list";
  static String getShiftDetail = "$prefix/shifts/detail";
  static String requestShift = "$prefix/shifts/request";
  static String favoriteClient = "$prefix/clients/favourite";
  static String getUpComingShifts = "$prefix/shifts/upcoming-list";
  static String getRequestedShifts = "$prefix/shifts/requested-list";
  static String getFilterBasicData = "$prefix/shifts/basic-data";
  static String getTimeSheetShiftList = "$prefix/time-sheet/shift-list";
  static String checkIsStaff = "$prefix/check-is-staff";
  static String appConfig = "$prefix/get-app-info";
  static String createPayroll = "$prefix/payroll/create";
  static String createHolidayRequest = "$prefix/payroll/create-holiday-request";
  static String totalAccountBalance = "$prefix/profile/total-account-balance";
  static String paymentHistory = "$prefix/payroll/payment-history";

  static String checkUserExist = "$prefix/check-user-exist";
  static String getNotificationList = "$prefix/profile/notification-list";
  static String getDocumentList = "$prefix/menu/unapproved-document-list";
  static String availabilities = "$prefix/availability/list";
  static String markAvailability = "$prefix/availability/create";
  static String faqList = "$prefix/profile/faq-list";
  static String cancelShift = "$prefix/shifts/cancel";
  static String documentUpload = "$prefix/menu/upload-unapproved-document";
  static String changePassword = "$prefix/profile/change-password";
  static String notificationSettings = "$prefix/profile/notification-settings";
  static String clearNotification = "$prefix/profile/notification-clear";
  static String favoriteClientList = "$prefix/clients/favourite-list";
  static String shiftHistoryList = "$prefix/shifts/history-list";
  static String virtualId = "$prefix/profile/virtual-id";
  static String profileDetail = "$prefix/profile/details";
  static String changeProfileSettings = "$prefix/profile/change-settings";
  static String getHome = "$prefix/home/list";
  static String activityLogList = "$prefix/shifts/check-in-out-log-list";
  static String profileDelete = "$prefix/profile/delete";
  static String timeSheetApprove = "$prefix/time-sheet/approve";
  static String confirmTimeSheet = "$prefix/time-sheet/confirm";
  static String offlineCheckIn = "$prefix/shifts/offline-check-in";
  static String offlineCheckOut = "$prefix/shifts/offline-check-out";
  static String onlineCheckIn = "$prefix/shifts/check-in";
  static String onlineCheckOut = "$prefix/shifts/check-out";
  static String onGoingShift = "$prefix/shifts/ongoing-data";
  static String timeSheetTimeUpdate = "$prefix/time-sheet/update";
  static String uploadPhysicalTimeSheet =
      "$prefix/time-sheet/physical-time-sheet/upload";
  static String approvePhysicalTimeSheet =
      "$prefix/time-sheet/physical-time-sheet/approve";
  static String getTimeSheetSummary = "$prefix/time-sheet/get-shift-details";
  static String registerBankDetails = "$prefix/register/bank-details";
  static String registerTermsAndCondition =
      "$prefix/register/terms-and-condition";
  static String holidayPayHistory = "$prefix/profile/holiday-pay-history";
  static String accountSummary = "$prefix/profile/account-summary";
  static String updateKycStatus = "$prefix/register/kyc-verification";
  static String saveWorkLocation = "$prefix/profile/save-work-location";
  static String holidayPayBalance =
      "$prefix/profile/holiday-pay-account-balance";
  static String registerData = "$prefix/register/edit";

  static String notificationSettingsList =
      "$prefix/profile/notification-settings-list";
  //! DOCUMENT WEB VIEW URL
  static String documentDEVWebViewUrl =
      "https://dev.xpresshealth-manager.webc.in/summary";
  static String documentQAWebViewUrl =
      "https://qa.xpresshealth-manager.webc.in/summary";
  static String documentUATWebViewUrl =
      "https://uat.xpresshealth-manager.webc.in/summary";
  static String documentBetaWebViewUrl =
      "https://manager.xpresshealth.webc.in/summary";

  static String termsAndConditionUrl = "";
  static String privacyPolicyUrl = "";

  //! REGISTER APP CONSTANTS --------- STARTS ---------
  static String getComplianceTraning = "$prefix/register/edit";
  static String updateUniformAndHealth = "$prefix/register/other-details";
  static String complianceDocUpload = "$prefix/register/upload-document";
  static String updateComplianceUploadStage =
      "$prefix/register/update-document-stage";
  static String updateBasicDetails = "$prefix/register/basic-details";
  static String updatePersonalDetails = "$prefix/register/personal-details";
  static String uploadPersonalDetailsFiles = "$prefix/register/file-upload";
  static String getRegisterSummary = "$prefix/register/recruitment_stages";
  static String updateWorkPermission = "$prefix/register/work-permission";
  static String updateComplianceDocumentComplition = "$prefix/";
  static String sendReferenceRequest =
      "$prefix/register/send-reference-request";
  static String submitReference = "$prefix/register/reference";
  //! REGISTER APP CONSTANTS ---------  END   ---------

}
