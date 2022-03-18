class Failure {
  final int code;
  final String? message;

  Failure({required this.code, this.message});

  @override
  String toString() => 'error code:$code message:$message';
}
