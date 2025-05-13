class DomainError {
  final String message;
  final String? messageId;
  final List<String>? details;

  DomainError({required this.message, this.messageId, this.details});

  static final _timeoutErrorMessage = "Request timed out. Please try again.";
  static final _connectionErrorMessage = "Connection error!";
  static final _unknownErrorMessage = "Something went wrong. Please try again.";
  static final _unexpectedResponseErrorMessage = "Unexpected response from server.";
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
  static DomainError unexpectedResponseError = DomainError(
    message: _unexpectedResponseErrorMessage,
    messageId: _unexpectedResponseErrorMessage,
  );
  static DomainError cancelledRequestError = DomainError(
    message: _cancelledRequestErrorMessage,
    messageId: _cancelledRequestErrorMessage,
  );
  static DomainError badCertificateError = DomainError(
    message: _badCertificateErrorMessage,
    messageId: _badCertificateErrorMessage,
  );
}
