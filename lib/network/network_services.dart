import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import '../common_functions/common_functions.dart';
import '../constants/app_constants.dart';
import 'network_base.dart';

class NetworkServices extends NetWorkBaseServices {
  // static const _buildEnvironment = 'dev';
   static const _buildEnvironment = 'qa';
  // static const _buildEnvironment = 'uat';
  // static const _buildEnvironment = 'beta';
  //static const _buildEnvironment = 'prod';

  static get buildEnvironment => _buildEnvironment;

  Future<String> getDynamicBaseUrl(bool isFromAuth) async {
    switch (buildEnvironment) {
      case 'dev':
        return isFromAuth ? AppConstants.authBaseUrl : AppConstants.userBaseUrl;
      case 'qa':
        return isFromAuth
            ? AppConstants.authQaBaseUrl
            : AppConstants.userQaBaseUrl;
      case 'uat':
        return isFromAuth
            ? AppConstants.authUatBaseUrl
            : AppConstants.userUatBaseUrl;
      case 'beta':
        return isFromAuth
            ? AppConstants.authBetaBaseUrl
            : AppConstants.userBetaBaseUrl;
      case 'prod':
        return isFromAuth
            ? AppConstants.authProdBaseUrl
            : AppConstants.userProdBaseUrl;
      default:
        throw Exception('Unknown build environment: $buildEnvironment');
    }
  }

  String getDynamicApiKey(bool isFromAuth) {
    switch (buildEnvironment) {
      case 'dev':
        return isFromAuth ? AppConstants.authApiKey : AppConstants.userApiKey;
      case 'qa':
        return isFromAuth
            ? AppConstants.authQaApiKey
            : AppConstants.userQaApiKey;
      case 'uat':
        return isFromAuth
            ? AppConstants.authUatApiKey
            : AppConstants.userUatApiKey;
      case 'beta':
        return isFromAuth
            ? AppConstants.authBetaApiKey
            : AppConstants.userBetaApiKey;
      case 'prod':
        return isFromAuth
            ? AppConstants.authProdApiKey
            : AppConstants.userProdApiKey;
      default:
        throw Exception('Unknown build environment: $buildEnvironment');
    }
  }

  static const kConnectTimeOut = Duration(milliseconds: 60000);
  static const kReceiveTimeOut = Duration(milliseconds: 60000);

  @override
  Either<ResponseError, BaseResponse> checkHttpStatus(BaseResponse response) {
    return getStatus(response);
  }

  @override
  Future<BaseResponse> getRequest(
    {
      required String endPoint,
      Map<String, dynamic>? parameters,
      bool isFromAuth = false
    }) async {
    if (!(await isInternetAvailable())) {
      throw ApiExceptions.noInternet();
    }
    final baseUrl = await getDynamicBaseUrl(isFromAuth);
    final dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      headers: {
        /*"Authorization": {"Bearer ${AppConstants.accessToken}"},*/
        "Content-Type": "application/json",
        "Accept": "application/json",
       /* "Api-Key": getDynamicApiKey(isFromAuth), // or AppConstants.userApiKey
        "X-App-Country": AppConstants.countryCode*/
      },
    ));
    try {
      log("URL : / ${dio.options.baseUrl}$endPoint");
      /*log("Headers : // API Key :: ${dio.options.headers["Api-key"]}");
      log("Headers : // Token :: ${dio.options.headers["Authorization"]}");*/
      log("GET BODY : // $parameters");

      Response response = await dio
          .get(endPoint, data: parameters)
          .timeout(kReceiveTimeOut, onTimeout: () {
        throw ApiExceptions.oops();
      });
      log("Response : /// ${response.data}");
      return BaseResponse(statusCode: response.statusCode, data: response.data);
    } on DioException catch (error) {
      return BaseResponse(
          statusCode: error.response?.statusCode, data: error.response?.data);
    } catch (e) {
      throw ApiExceptions.oops();
    }
  }

  @override
  Future<BaseResponse> postRequest(
      {required String endPoint,
      Map<String, dynamic>? parameters,
      bool isFromAuth = false}) async {
    if (!(await isInternetAvailable())) {
      throw ApiExceptions.noInternet();
    }
    final baseUrl = await getDynamicBaseUrl(isFromAuth);
    final dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      headers: {
        "Authorization": {"Bearer ${AppConstants.accessToken}"},
        "Content-Type": "application/json",
        "Api-Key": getDynamicApiKey(isFromAuth),
        "X-App-Country": AppConstants.countryCode,
        if (isFromAuth) "device": Platform.isIOS ? "Ios" : "Android",
      },
    ));

    try {
      log("URL : / ${dio.options.baseUrl}$endPoint");
      log("Headers : // API Key :: ${dio.options.headers["Api-key"]}");
      log("Headers: // API Key :: ${dio.options.headers["X-App-Country"]}");
      log("Headers : // Token :: ${dio.options.headers["Authorization"]}");
      log("POST BODY : // $parameters");
      Response response = await dio
          .post(
        endPoint,
        data: parameters,
      )
          .timeout(kReceiveTimeOut, onTimeout: () {
        throw ApiExceptions.oops();
      });
      log("Response : /// ${response.data}");
      return BaseResponse(statusCode: response.statusCode, data: response.data);
    } on DioException catch (error) {
      return BaseResponse(
          statusCode: error.response?.statusCode, data: error.response?.data);
    } catch (e) {
      log("Exception Error : // $e");
      throw ApiExceptions.oops();
    }
  }

  @override
  Future<BaseResponse> multiPartRequest({
    required String endPoint,
    required FormData formFields,
    bool isFromAuth = false,
  }) async {
    if (!(await isInternetAvailable())) {
      throw ApiExceptions.noInternet();
    }
    final baseUrl = await getDynamicBaseUrl(isFromAuth);
    final dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      headers: {
        "Authorization": "Bearer ${AppConstants.accessToken}",
        "Content-Type": "multipart/form-data",
        "Api-Key": getDynamicApiKey(isFromAuth),
        "X-App-Country": AppConstants.countryCode
      },
    ));

    try {
      log("URL : / ${dio.options.baseUrl}$endPoint");
      log("Headers : // API Key :: ${dio.options.headers["Api-key"]}");
      log("Headers: // API Key :: ${dio.options.headers["X-App-Country"]}");
      log("Headers : // Token :: ${dio.options.headers["Authorization"]}");

      Response response = await dio
          .post(endPoint, data: formFields)
          .timeout(kReceiveTimeOut, onTimeout: () {
        throw ApiExceptions.oops();
      });

      log("Response : /// ${response.data}");
      return BaseResponse(statusCode: response.statusCode, data: response.data);
    } on DioException catch (error) {
      return BaseResponse(
          statusCode: error.response?.statusCode, data: error.response?.data);
    } catch (e) {
      log("Exception Error : // $e");
      throw ApiExceptions.oops();
    }
  }

  @override
  Future<BaseResponse> postFile({
    required String endPoint,
    required FormData formFields,
    required void Function(int, int)? onSendProgress,
    bool isFromAuth = false,
  }) async {
    if (!(await isInternetAvailable())) {
      throw ApiExceptions.noInternet();
    }
    final baseUrl = await getDynamicBaseUrl(isFromAuth);
    final dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      headers: {
        "Authorization": "Bearer ${AppConstants.accessToken}",
        "Content-Type": "multipart/form-data",
        "Api-Key": getDynamicApiKey(isFromAuth),
        "X-App-Country": AppConstants.countryCode
      },
    ));

    try {
      log("URL : / ${dio.options.baseUrl}$endPoint");
      log("Headers : // API Key :: ${dio.options.headers["Api-key"]}");
      log("Headers: // API Key :: ${dio.options.headers["X-App-Country"]}");
      log("Headers : // Token :: ${dio.options.headers["Authorization"]}");

      Response response = await dio
          .post(endPoint, data: formFields, onSendProgress: onSendProgress)
          .timeout(kReceiveTimeOut, onTimeout: () {
        throw ApiExceptions.oops();
      });

      log("Response : /// ${response.data}");
      return BaseResponse(statusCode: response.statusCode, data: response.data);
    } on DioException catch (error) {
      return BaseResponse(
          statusCode: error.response?.statusCode, data: error.response?.data);
    } catch (e) {
      log("Exception Error : // $e");
      throw ApiExceptions.oops();
    }
  }

  @override
  Either<ResponseError, BaseResponse> getStatus(BaseResponse response) {
    switch (response.statusCode) {
      case 200:
        return Right(response);
      case 400:
        return Right(response);
      case 401:
        return Left(ResponseError(
            key: ApiErrorTypes.unAuthorized,
            message: "UnAuthorized",
            response: response.data));
      case 403:
        return Left(ResponseError(
            key: ApiErrorTypes.unAuthorized,
            message: "UnAuthorized",
            response: response.data));
      case 404:
        return Left(ResponseError(
            key: ApiErrorTypes.notFound,
            message: "Not Found",
            response: response.data));
      case 422:
        return Left(ResponseError(
            key: ApiErrorTypes.unAuthorized,
            message: "UnAuthorized",
            response: response.data));
      case 500:
        return Left(ResponseError(
            key: ApiErrorTypes.internalServerError,
            message: "Internal Server Error",
            response: response.data));
      case 503:
        return Left(ResponseError(
            key: ApiErrorTypes.serviceUnavailable,
            message: "Service Unavailable",
            response: response.data));
      default:
        return Left(ResponseError(
            key: ApiErrorTypes.unknown,
            message: "Unknown",
            response: response.data));
    }
  }

  @override
  Future<Either<ResponseError, dynamic>> parseJson(
      BaseResponse response) async {
    try {
      return Right(response.data);
    } catch (e) {
      return const Left(ResponseError(
          key: ApiErrorTypes.jsonParsing, message: "Failed on json Parsing"));
    }
  }

  @override
  Future<Either<ResponseError, BaseResponse>> safe(
      Future<BaseResponse> request) async {
    try {
      return Right(await request);
    } on ApiExceptions catch (error) {
      return Left(ResponseError(
          key: error.errorType,
          message: error.message,
          response: error.response));
    } catch (e) {
      return Left(ResponseError(
          key: ApiErrorTypes.unknown, message: "Unknown Error : $e"));
    }
  }
}
