import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection time out, please try later");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send time out, please try later");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receive time out, please try later");
      case DioExceptionType.badCertificate:
        return ServerFailure("Bad Certificate, please try later");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.data, dioException.response!.statusCode);
      case DioExceptionType.cancel:
        return ServerFailure("The request cancelled");
      case DioExceptionType.connectionError:
        return ServerFailure("Connection error, please try later");
      case DioExceptionType.unknown:
        if (dioException.message!.contains("SocketException")) {
          return ServerFailure("No internet connection");
        }
        return ServerFailure("Unexpected error, please try again");
    }
  }

  factory ServerFailure.fromResponse(dynamic response, int? statusCode) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response["error"]["message"]);
    } else if (statusCode == 404) {
      return ServerFailure("Your request not found, please try later");
    } else if (statusCode == 500) {
      return ServerFailure("Internal server error, please try later");
    } else {
      return ServerFailure("Ops there was an error, please try later");
    }
  }
}
