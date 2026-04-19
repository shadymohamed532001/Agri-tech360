enum FailureType { server, flutter }

abstract class Failure {
  final String errMessage;
  final FailureType type;

  const Failure(this.errMessage, {this.type = FailureType.server});
}
