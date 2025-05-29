import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../enums/enums.dart';
import '../network/network_base.dart';


Future<bool> isInternetAvailable() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
  return false;
}

// void launchCall(String? number) async {
//   final Uri phoneUri =
//       Uri.parse(Platform.isIOS ? 'tel://$number' : 'tel:$number');
//
//   try {
//     if (await canLaunchUrl(phoneUri)) {
//       await launchUrl(phoneUri, mode: LaunchMode.externalApplication);
//     } else {
//       debugPrint('Could not launch $phoneUri');
//     }
//   } catch (e) {
//     debugPrint('Error launching phone call: $e');
//   }
// }
//
// void afterInit(Function function) {
//   SchedulerBinding.instance.addPostFrameCallback((_) {
//     function.call();
//   });
// }
//
LoaderState handleResponseError(ApiErrorTypes errorType) {
  return switch (errorType) {
    ApiErrorTypes.cancel => LoaderState.error,
    ApiErrorTypes.noInternet => LoaderState.networkError,
    ApiErrorTypes.badCertificate => LoaderState.error,
    ApiErrorTypes.badResponse => LoaderState.error,
    ApiErrorTypes.connectionError => LoaderState.error,
    ApiErrorTypes.connectionTimeout => LoaderState.error,
    ApiErrorTypes.badRequest => LoaderState.error,
    ApiErrorTypes.jsonParsing => LoaderState.error,
    ApiErrorTypes.internalServerError => LoaderState.serverError,
    ApiErrorTypes.sendTimeout => LoaderState.error,
    ApiErrorTypes.notFound => LoaderState.error,
    ApiErrorTypes.oops => LoaderState.error,
    ApiErrorTypes.unAuthorized => LoaderState.error,
    ApiErrorTypes.serviceUnavailable => LoaderState.error,
    ApiErrorTypes.receiveTimeout => LoaderState.error,
    _ => LoaderState.error,
  };
}
//
// void showCustomToast({
//   required String message,
//   bool? isSuccess,
//   Duration? duration,
//   String? link,
//   VoidCallback? onTap,
//   bool? increaseBottomPadding,
// }) {
//   toastification.showCustom(
//     autoCloseDuration: duration ?? const Duration(seconds: 3),
//     alignment: Alignment.bottomCenter,
//     builder: (BuildContext context, ToastificationItem holder) {
//       return CustomToastWidget(
//         message: message,
//         isSuccess: isSuccess,
//         link: link,
//         onLinkTap: onTap,
//         increaseBottomPadding: increaseBottomPadding,
//       );
//     },
//   );
// }
//
// //*-----------------------------------------------------*//
// Map<String, String> getFirstAndLastName(String fullName) {
//   fullName = fullName.trim();
//   List<String> nameParts = fullName.split(' ');
//   if (nameParts.length == 1) {
//     return {'firstName': nameParts[0], 'lastName': ''};
//   } else {
//     return {'firstName': nameParts.first, 'lastName': nameParts.last};
//   }
// }
// //! EXAMPLE
// // Map<String, String> name = getFirstAndLastName(fullName);
// // print('First Name: ${name['firstName']}');
// // print('Last Name: ${name['lastName']}');
// //*-----------------------------------------------------*//
//
// SystemUiOverlayStyle get systemOverlayStyle => Platform.isAndroid
//     ? const SystemUiOverlayStyle(
//         statusBarIconBrightness: Brightness.dark,
//         statusBarColor: ColorPalette.white,
//         systemNavigationBarIconBrightness: Brightness.dark,
//         systemNavigationBarDividerColor: ColorPalette.white,
//         systemNavigationBarColor: ColorPalette.white,
//       )
//     : const SystemUiOverlayStyle(
//         statusBarBrightness: Brightness.light,
//         statusBarIconBrightness: Brightness.dark,
//       );
//
// SystemUiOverlayStyle get whiteOverlayStyle => const SystemUiOverlayStyle(
//       statusBarIconBrightness: Brightness.light,
//       statusBarColor: ColorPalette.white,
//       systemNavigationBarIconBrightness: Brightness.light,
//       systemNavigationBarDividerColor: ColorPalette.white,
//       systemNavigationBarColor: ColorPalette.white,
//     );
// SystemUiOverlayStyle get whiteTrasnParentOverlayStyle =>
//     const SystemUiOverlayStyle(
//       statusBarIconBrightness: Brightness.dark,
//       statusBarColor: ColorPalette.transparent,
//       systemNavigationBarIconBrightness: Brightness.light,
//       systemNavigationBarDividerColor: ColorPalette.white,
//       systemNavigationBarColor: ColorPalette.white,
//     );
//
// SystemUiOverlayStyle get transparentOverlayStyle => const SystemUiOverlayStyle(
//       statusBarIconBrightness: Brightness.dark,
//       statusBarColor: Colors.transparent,
//       systemNavigationBarIconBrightness: Brightness.dark,
//       systemNavigationBarDividerColor: ColorPalette.fF7F7F7,
//       systemNavigationBarColor: ColorPalette.fF7F7F7,
//     );
// SystemUiOverlayStyle get transparentWhiteOverlayStyle =>
//     const SystemUiOverlayStyle(
//       statusBarIconBrightness: Brightness.light,
//       statusBarColor: Colors.transparent,
//       systemNavigationBarIconBrightness: Brightness.dark,
//       systemNavigationBarDividerColor: ColorPalette.fF7F7F7,
//       systemNavigationBarColor: ColorPalette.fF7F7F7,
//     );
//
// String convertTimeFormat(String time) {
//   try {
//     DateTime dateTime = DateFormat("HH:mm:ss").parse(time);
//     String formattedTime = DateFormat("hh:mm a").format(dateTime);
//     return formattedTime;
//   } catch (e) {
//     return "Invalid time format";
//   }
// }
//
// String reduceDecimal(String value) {
//   double? parsedValue = double.tryParse(value);
//   if (parsedValue != null) {
//     return ((parsedValue * 1000).truncateToDouble() / 1000).toString();
//   }
//   return value;
// }
//
// String convertTimeString(String time) {
//   List<String> parts = time.split('.');
//   String seconds = parts.length > 1 ? parts[1].padRight(2, '0') : '00';
//   return "${parts[0]}:$seconds";
// }
//
// String reduceDecimalByOne(String value) {
//   double? parsedValue = double.tryParse(value);
//   if (parsedValue != null) {
//     return ((parsedValue * 10).truncateToDouble() / 10).toString();
//   }
//   return value;
// }
//
// String getStatusText(String staus) {
//   switch (staus) {
//     case 'pending':
//       return 'Pending';
//     case 'expired':
//       return 'Expired';
//     case 'not_approved':
//       return 'Not Approved';
//     case 'rejected':
//       return 'Rejected';
//     case 'approved':
//       return 'Approved';
//     default:
//       return '';
//   }
// }
//
// Color getStatusColor(String staus) {
//   switch (staus) {
//     case 'pending':
//       return ColorPalette.fF59E0B;
//     case 'expired':
//       return ColorPalette.fE53B40;
//     case 'not_approved':
//       return ColorPalette.f737A86;
//     case 'rejected':
//       return ColorPalette.fE53B40;
//     case 'approved':
//       return ColorPalette.primaryColor;
//     default:
//       return ColorPalette.f737A86;
//   }
// }
//
// String convertDateWeekFormat(String? date) {
//   DateFormat inputFormat = DateFormat('dd-MM-yyyy');
//   DateTime? parsedDate = inputFormat.tryParse(date ?? "");
//   DateFormat outputFormat = DateFormat('dd MMM EEE');
//   String formattedDate = outputFormat.format(parsedDate ?? DateTime.now());
//   return formattedDate;
// }
//
// String convertDateTimeToSummaryFormat(DateTime? dateTime) {
//   if (dateTime == null) {
//     return '';
//   }
//   debugPrint(
//       'SUMMARY CARD DATE : $dateTime --- ${DateFormat('d MMM hh:mm a').format(dateTime)}');
//   return DateFormat('d MMM hh:mm a').format(dateTime);
// }
//
// Map<String, String> getDateRangeFromFilter(DateRangeFilter filter) {
//   final now = DateTime.now();
//   late DateTime startDate;
//   late DateTime endDate;
//
//   switch (filter) {
//     case DateRangeFilter.currentMonth:
//       startDate = DateTime(now.year, now.month, 1);
//       endDate = DateTime(now.year, now.month + 1, 0);
//       break;
//
//     case DateRangeFilter.lastMonth:
//       startDate = DateTime(now.year, now.month - 1, 1);
//       endDate = DateTime(now.year, now.month, 0);
//       break;
//
//     case DateRangeFilter.lastYear:
//       startDate = DateTime(now.year - 1, 1, 1);
//       endDate = DateTime(now.year - 1, 12, 31);
//       break;
//
//     case DateRangeFilter.custom:
//       startDate = DateTime.now();
//       endDate = DateTime.now();
//       break;
//   }
//
//   String formatDate(DateTime date) =>
//       '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
//
//   return {
//     'start_date': formatDate(startDate),
//     'end_date': formatDate(endDate),
//   };
// }
//
// String parseHtmlContent(String html) {
//   return parse(html).body?.text ?? "";
// }
//
// showDocExpiredDialog(BuildContext context) {
//   showGeneralDialog(
//     context: context,
//     barrierLabel: "Barrier",
//     barrierDismissible: false,
//     barrierColor: Colors.black54,
//     transitionDuration: const Duration(milliseconds: 200),
//     pageBuilder: (context, anim1, anim2) {
//       return Center(
//         child: CommonAlertDialogBox(
//           cancelButtonTitle: "Cancel",
//           onSuccess: () {
//             Navigator.of(context)
//                 .pushNamed(RouteConstants.routeDocuments,
//                     arguments: DocuementHomeArgs(
//                       onSuccess: () {},
//                     ))
//                 .whenComplete(
//               () {
//                 if (!context.mounted) return;
//                 Navigator.pop(context);
//               },
//             );
//           },
//           title: "Document Expired",
//           content:
//               "You have documents that are expired or invalid. Please click the below to resubmit them",
//           isAlignmentVertical: false,
//           buttonTitle: "Yes, Continue",
//         ),
//       );
//     },
//     transitionBuilder: (context, anim1, anim2, child) {
//       return FadeTransition(
//         opacity: anim1,
//         child: ScaleTransition(
//           scale: Tween<double>(
//             begin: 0.8,
//             end: 1.0,
//           ).animate(CurvedAnimation(
//             parent: anim1,
//             curve: Curves.easeOutBack,
//           )),
//           child: child,
//         ),
//       );
//     },
//   );
// }
//
// int? convertToInt(var valArg, {int defValue = 0}) {
//   if (valArg == null || valArg.isEmpty) return null;
//   switch (valArg.runtimeType) {
//     case const (int):
//       return valArg;
//     case const (double):
//       return valArg.toInt();
//     case const (String):
//       return int.tryParse(valArg) ?? 0;
//     default:
//       return null;
//   }
// }
