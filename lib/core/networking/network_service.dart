import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:foodappassignment8/core/networking/network_constants.dart';
import 'package:foodappassignment8/core/networking/network_failure.dart';

class NetworkService {
  final Dio dio;

  NetworkService({Dio? dio})
      : dio = dio ??
            Dio(BaseOptions(
                baseUrl: NetworkConstants.baseUrl,
                receiveTimeout: NetworkConstants.receiveTimeout,
                connectTimeout: NetworkConstants.connectTimeout)){
    this.dio.interceptors.add(LogInterceptor(responseBody: true, error: true));
  }

  Future<Either<NetworkFailure,Response>> getPath(String path,{Map<String,dynamic>? queryParams }) async {
    try{
      final response=await  dio.get(path,queryParameters: queryParams);
      final failure=_handleStatusCode(response.statusCode);
      if(failure!=null){
        return Left(failure);
      }
      return Right(response);
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(NetworkFailure("Unexpected error: ${e.toString()}"));
    }

  }
  NetworkFailure? _handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 200:
      case 201:
        return null;
      case 400:
        return NetworkFailure("Bad Request");
      case 401:
        return NetworkFailure("Unauthorized");
      case 403:
        return NetworkFailure("Forbidden");
      case 404:
        return NetworkFailure("Not Found");
      case 500:
        return NetworkFailure("Internal Server Error");
      default:
        return NetworkFailure("Unexpected error: $statusCode");
    }
  }
  NetworkFailure _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return NetworkFailure("Connection Timeout");
      case DioExceptionType.receiveTimeout:
        return NetworkFailure("Receive Timeout");
      case DioExceptionType.sendTimeout:
        return NetworkFailure("Send Timeout");
      case DioExceptionType.badResponse:
        return NetworkFailure(
            "Bad Response: ${e.response?.statusCode ?? 'Unknown'}");
      case DioExceptionType.cancel:
        return NetworkFailure("Request Cancelled");
      case DioExceptionType.unknown:
      default:
        return NetworkFailure("Unknown Error: ${e.message}");
    }
  }

}
