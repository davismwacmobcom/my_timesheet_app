import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

abstract class NetWorkBaseServices {
  Either<ResponseError, BaseResponse> getStatus(BaseResponse response);

  Future<Either<ResponseError, BaseResponse>> safe(
      Future<BaseResponse> request);

  Either<ResponseError, BaseResponse> checkHttpStatus(BaseResponse response);

  Future<Either<ResponseError, dynamic>> parseJson(BaseResponse response);

  Future<BaseResponse> getRequest(
      {required String endPoint,
        Map<String, dynamic>? parameters,
        bool isFromAuth = false});

  Future<BaseResponse> postRequest(
      {required String endPoint,
        Map<String, dynamic>? parameters,
        bool isFromAuth = false});

  Future<BaseResponse> multiPartRequest(
      {required String endPoint,
        required FormData formFields,
        bool isFromAuth = false});

  Future<BaseResponse> postFile(
      {required String endPoint,
        required FormData formFields,
        required void Function(int, int)? onSendProgress,
        bool isFromAuth = false});
}

class BaseResponse {
  int? statusCode;
  dynamic data;

  BaseResponse({this.statusCode, this.data});
}

enum ApiErrorTypes {
  connectionTimeout,
  sendTimeout,
  receiveTimeout,
  badCertificate,
  badResponse,
  cancel,
  connectionError,
  unknown,
  unAuthorized,
  badRequest,
  internalServerError,
  serviceUnavailable,
  notFound,
  jsonParsing,
  noInternet,
  oops,
}

class ResponseError {
  final ApiErrorTypes key;
  final String? message;
  final dynamic response;

  const ResponseError({
    required this.key,
    this.message,
    this.response,
  });
}

class ApiExceptions implements Exception {
  final String? message;
  final ApiErrorTypes errorType;
  final dynamic response;

  ApiExceptions(
      {this.message = "Unknown",
        this.errorType = ApiErrorTypes.unknown,
        this.response});

  factory ApiExceptions.noInternet() => ApiExceptions(
      message: "No Internet", errorType: ApiErrorTypes.noInternet);

  factory ApiExceptions.oops() =>
      ApiExceptions(message: "Oops", errorType: ApiErrorTypes.oops);
}
