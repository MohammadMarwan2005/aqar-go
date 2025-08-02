import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:flutter/cupertino.dart';

class DomainError {
  final String message;
  final String? messageId;
  final Map<String, String>? params;
  final List<String>? details;

  DomainError({
    required this.message,
    this.messageId,
    this.params,
    this.details,
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

  static DomainError cancelledRequestError = DomainError(
    message: _cancelledRequestErrorMessage,
    messageId: _cancelledRequestErrorMessage,
  );
  static DomainError badCertificateError = DomainError(
    message: _badCertificateErrorMessage,
    messageId: _badCertificateErrorMessage,
  );
}

extension X on DomainError {
  String getMessage(BuildContext context) {
    return messageId?.tr(context, params: params) ?? message;
  }
}
