

enum CustomExceptionType {
  notFound,
  noInternet,
  parseError
}


class CustomException {
  final int status;
  final String exception;
  final CustomExceptionType type;

  CustomException(this.exception, this.type, {this.status});

  @override
  String toString() => "${this.type} - ${this.exception}";

}