import 'package:dartz/dartz.dart';
import 'package:exception_type/exception_type.dart';

abstract class IEitherUseCase<T, Params> {
  Future<Either<IFailure, T>> call(Params params);
}

abstract class IEitherNonFutureUseCase<T, Params> {
  Either<IFailure, T> call(Params params);
}

abstract class IEitherStreamUseCase<T, Params> {
  Stream<Either<IFailure, T>> call(Params params);
}

abstract class IOptionUseCase<T, Params> {
  Option<T> call(Params params);
}

abstract class IOptionStreamUseCase<T, Params> {
  Option<Stream<T>> call(Params params);
}

abstract class IFutureOptionStreamUseCase<T, Params> {
  Future<Option<Stream<T>>> call(Params params);
}

abstract class IStreamUseCase<T, Params> {
  Stream<T> call(Params params);
}

abstract class IFutureUseCase<T, Params> {
  Future<T> call(Params params);
}

abstract class IUseCase<T, Params> {
  T call(Params params);
}
