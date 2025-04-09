import 'package:exception_type/i_errors/i_failure.dart';
import 'package:i_tdd/i_tdd.dart';
import 'package:dartz/dartz.dart';

// A sample use case implementation
class GetSampleDataUseCase extends IEitherUseCase<String, NoParams> {
  @override
  Future<Either<IFailure, String>> call(NoParams params) async {
    try {
      // Simulate a successful API call or DB query
      return right("Hello from i_tdd use case!");
    } catch (e) {
      return left(SampleFailure("Something went wrong"));
    }
  }
}

// A sample failure implementation
class SampleFailure implements IFailure {
  final String message;
  SampleFailure(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}

void main() async {
  final useCase = GetSampleDataUseCase();

  final result = await useCase(NoParams());

  result.handleReport(
    onSuccess: (data) => print("Success: $data"),
    onFailed: (msg) => print("Error: $msg"),
  );
}
