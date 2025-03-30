import 'package:dartz/dartz.dart';
import 'package:i_tdd/domain/models/params.dart';

typedef SuccessCallback<R> = void Function(R successData);
typedef FailureCallback = void Function(String message);
typedef StreamCallback<R> = Option<Stream<R>> Function(NoParams);
