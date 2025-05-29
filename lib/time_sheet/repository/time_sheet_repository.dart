
import 'package:either_dart/either.dart';
import 'package:get_it/get_it.dart';
import '../../../network/network_base.dart';
import '../model/flagged_shift_response.dart';
import '../model/payout_response.dart';
import '../model/submitted_shift_response.dart';
import '../model/unattended_shift_response.dart';
import '../model/withdraw_shift_response.dart';

abstract class TimeSheetRepo {

  Future<Either<ResponseError, PayoutResponse?>> getPayoutResponse({
    Map<String, dynamic>? params,
  });

  Future<Either<ResponseError, UnattendedShiftResponse?>> getUnattendedResponse({
    Map<String, dynamic>? params,
  });
  Future<Either<ResponseError, SubmittedShiftListResponse?>> getSubmittedResponse({
    Map<String, dynamic>? params,
  });
  Future<Either<ResponseError, WithdrawShiftListResponse?>> getWithdrawResponse({
    Map<String, dynamic>? params,
  });
  Future<Either<ResponseError, FlaggedShiftListResponse?>> getFlaggedResponse({
    Map<String, dynamic>? params,
  });
}

class TimeSheetRepoImplements extends TimeSheetRepo{

  final dio = GetIt.instance<NetWorkBaseServices>();

  @override
  Future<Either<ResponseError, PayoutResponse?>> getPayoutResponse({Map<String, dynamic>? params}) {
    return dio
        .safe(dio.getRequest(endPoint: "/v3/395122fc-7fe7-4a3c-9634-29183f017596"))
        .thenRight(dio.checkHttpStatus)
        .thenRight(dio.parseJson)
        .mapRight((right) => PayoutResponse.fromJson(right));
  }

  @override
  Future<Either<ResponseError, UnattendedShiftResponse?>> getUnattendedResponse({Map<String, dynamic>? params}) {
    return dio
        .safe(dio.getRequest(endPoint: "/v3/be72b43a-5783-4767-a405-1ad2a00dbf47"))
        .thenRight(dio.checkHttpStatus)
        .thenRight(dio.parseJson)
        .mapRight((right) => UnattendedShiftResponse.fromJson(right));
  }
  @override
  Future<Either<ResponseError, SubmittedShiftListResponse?>> getSubmittedResponse({Map<String, dynamic>? params}) {
    return dio
        .safe(dio.getRequest(endPoint: "/v3/d606ccd6-6720-40a1-91c7-220f12ddf7b9"))
        .thenRight(dio.checkHttpStatus)
        .thenRight(dio.parseJson)
        .mapRight((right) => SubmittedShiftListResponse.fromJson(right));
  }
  @override
  Future<Either<ResponseError, WithdrawShiftListResponse?>> getWithdrawResponse({Map<String, dynamic>? params}) {
    return dio
        .safe(dio.getRequest(endPoint: "/v3/28807b48-23ae-4be8-929f-ab2b10f6f217"))
        .thenRight(dio.checkHttpStatus)
        .thenRight(dio.parseJson)
        .mapRight((right) => WithdrawShiftListResponse.fromJson(right));
  }
  @override
  Future<Either<ResponseError, FlaggedShiftListResponse?>> getFlaggedResponse({Map<String, dynamic>? params}) {
    return dio
        .safe(dio.getRequest(endPoint: "/v3/8d4be20a-0fe6-4846-ab26-26ccee3374d7"))
        .thenRight(dio.checkHttpStatus)
        .thenRight(dio.parseJson)
        .mapRight((right) => FlaggedShiftListResponse.fromJson(right));
  }
}