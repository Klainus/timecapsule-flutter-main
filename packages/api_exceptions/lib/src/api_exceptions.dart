/// Thrown if an exception occurs while making an `http` request.
class HttpException implements Exception {
  const HttpException(this.error);

  final Object error;

  @override
  String toString() => 'HttpException: $error';
}

/// Thrown if an `http` request returns an invalid status code.
class HttpRequestFailure implements Exception {
  const HttpRequestFailure(this.statusCode, this.body);

  final int? statusCode;
  final dynamic body;

  @override
  String toString() => 'HttpRequestFailure: $statusCode $body';
}

/// Thrown when an error occurs while deserializing the response body.
class JsonDeserializationException implements Exception {
  const JsonDeserializationException(this.error, this.body);

  final Object error;
  final dynamic body;

  @override
  String toString() => 'JsonDeserializationException: $error $body';
}
