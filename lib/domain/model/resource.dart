import 'domain_error.dart';

sealed class Resource<T> {
  const Resource();

  R when<R>({
    required R Function(T successData) onSuccess,
    required R Function(DomainError error) onError,
  }) {
    switch (this) {
      case Success<T> _:
        return onSuccess((this as Success<T>).data);
      case Error<T> _:
        return onError((this as Error<T>).error);
    }
  }
}

class Success<T> extends Resource<T> {
  final T data;

  const Success(this.data);
}

class Error<T> extends Resource<T> {
  final DomainError error;

  const Error(this.error);
}
