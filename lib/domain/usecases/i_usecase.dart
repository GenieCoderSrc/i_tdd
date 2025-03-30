import 'package:dartz/dartz.dart';
import 'package:exceptions/exceptions.dart';

abstract class IEitherUseCase<Type, Params> {
  Future<Either<IFailure, Type>> call(Params params);
}

abstract class IEitherNonFutureUseCase<Type, Params> {
  Either<IFailure, Type> call(Params params);
}

abstract class IEitherStreamUseCase<Type, Params> {
  Stream<Either<IFailure, Type>> call(Params params);
}

abstract class IOptionUseCase<Type, Params> {
  Option<Type> call(Params params);
}

abstract class IOptionStreamUseCase<Type, Params> {
  Option<Stream<Type>> call(Params params);
}

abstract class IFutureOptionStreamUseCase<Type, Params> {
  Future<Option<Stream<Type>>> call(Params params);
}

abstract class IStreamUseCase<Type, Params> {
  Stream<Type> call(Params params);
}

abstract class IFutureUseCase<Type, Params> {
  Future<Type> call(Params params);
}

abstract class IUseCase<Type, Params> {
  Type call(Params params);
}
