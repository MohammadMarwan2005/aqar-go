import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:flutter/cupertino.dart';

class DomainError {
  final String message;
  final String? messageId;
  final Map<String, String>? params;
  final List<String>? details;
  final Map<String, List<String>>?
  validationErrors; // ex: {"password": [required, min]}

  DomainError({
    required this.message,
    this.messageId,
    this.params,
    this.details,
    this.validationErrors,
  });

  static final _timeoutErrorMessage = "Request timed out. Please try again.";
  static final _connectionErrorMessage = "Connection error!";
  static final _unknownErrorMessage = "Something went wrong. Please try again.";
  static final _unexpectedResponseErrorMessage =
      "Unexpected response from server.";
  static final _unexpectedResponseErrorMessageWithParams =
      "Unexpected response from server: {response}";
  static final _cancelledRequestErrorMessage = "Request was cancelled.";
  static final _badCertificateErrorMessage = "Bad SSL certificate.";
  static final _cantGetYourLocationErrorMessage =
      "Can't get your location. Please enable location and try again.";
  static final _locationPermissionIsDeniedErrorMessage =
      "Location permission is denied. Please allow location access and try again.";

  static final _invalidInputErrorMessage = "Invalid input.";

  /// Indicates a connection error, which can occur due to no internet access
  /// or if the server is unreachable (e.g., the server is shut down or refused the connection).
  static DomainError connectionError = DomainError(
    message: _connectionErrorMessage,
    messageId: _connectionErrorMessage,
  );
  static DomainError timeoutError = DomainError(
    message: _timeoutErrorMessage,
    messageId: _timeoutErrorMessage,
  );
  static DomainError unknownError = DomainError(
    message: _unknownErrorMessage,
    messageId: _unknownErrorMessage,
  );

  static DomainError getUnexpectedError(String response) {
    final responsePreview =
        response.length > 100 ? "${response.substring(0, 99)}..." : response;
    return DomainError(
      message: _unexpectedResponseErrorMessage,
      messageId: _unexpectedResponseErrorMessageWithParams,
      params: {"response": responsePreview},
    );
  }

  // errors example: {password: [required]}
  static DomainError getInvalidInputError(Map<String, List<dynamic>>? errors) {
    return DomainError(
      messageId: _invalidInputErrorMessage,
      message: _invalidInputErrorMessage,
      validationErrors: errors?.map(
        (key, value) => MapEntry(key, value.map((e) => e.toString()).toList()),
      ),
    );
  }

  static DomainError cancelledRequestError = DomainError(
    message: _cancelledRequestErrorMessage,
    messageId: _cancelledRequestErrorMessage,
  );
  static DomainError badCertificateError = DomainError(
    message: _badCertificateErrorMessage,
    messageId: _badCertificateErrorMessage,
  );

  static DomainError cantGetYourLocationError = DomainError(
    message: _cantGetYourLocationErrorMessage,
    messageId: _cantGetYourLocationErrorMessage,
  );
  static DomainError locationPermissionIsDeniedError = DomainError(
    message: _locationPermissionIsDeniedErrorMessage,
    messageId: _locationPermissionIsDeniedErrorMessage,
  );
}

extension X on DomainError {
  String getMessage(BuildContext context) {
    return messageId?.tr(context, params: params) ?? message;
  }

  List<String>? getTranslatedDetailsOrValidationErrors(BuildContext context) {
    if (details != null) return details!.map((e) => e.tr(context)).toList();

    if (validationErrors != null) {
      final List<String> messages = List.of([], growable: true);
      validationErrors!.forEach((key, value) {
        for (var element in value) {
          messages.add(
            element.tr(context, params: {"attribute": key.tr(context)}),
          );
        }
      });
      return messages;
    }
    return null;
  }
}
