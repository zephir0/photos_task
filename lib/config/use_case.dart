abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

class NoParams {}

class WithParams {
  final dynamic data;

  WithParams(this.data);
}
