class Failure{
  int code;
  String message;

  Failure(this.code, this.message);
}

class ResponseFailure extends Failure{
  final String arMessage;
  final String enMessage;
  ResponseFailure(super.code, super.message, this.arMessage, this.enMessage);
}