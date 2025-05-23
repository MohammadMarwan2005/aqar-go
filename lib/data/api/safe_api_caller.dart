import 'dart:io';
import 'package:dio/dio.dart';

import '../../domain/model/resource.dart';
import '../../domain/model/domain_error.dart';
import '../model/api_error.dart';

class SafeAPICaller {
  SafeAPICaller();

  Future<Resource<Domain>> call<Domain, Data>({
    required Future<Data> Function() apiCall,
    required Domain Function(Data data) dataToDomain,
  }) async {
    try {
      final data = await apiCall();
      final domain = dataToDomain(data);
      return Success(domain);
    } on DioException catch (dioError) {
      final error = mapDioExceptionToDomainError(dioError);
      return Error(error);
    } catch (e) {
      return Error(DomainError(message: 'Unexpected error: $e'));
    }
  }

  DomainError mapDioExceptionToDomainError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return DomainError.timeoutError;

      case DioExceptionType.badResponse:
        final statusCode = dioError.response?.statusCode;
        final responseData = dioError.response?.data;

        if (statusCode != null && responseData != null) {
          try {
            return APIError.fromJson(responseData).toDomainError();
          } catch (_) {
            return DomainError.unexpectedResponseError;
          }
        } else {
          return DomainError.unexpectedResponseError;
        }

      case DioExceptionType.cancel:
        return DomainError.cancelledRequestError;

      case DioExceptionType.unknown:
        if (dioError.error is SocketException) {
          return DomainError.connectionError;
        }
        return DomainError.unknownError;

      case DioExceptionType.badCertificate:
        return DomainError.badCertificateError;

      case DioExceptionType.connectionError:
        return DomainError.connectionError;
    }
  }
}
