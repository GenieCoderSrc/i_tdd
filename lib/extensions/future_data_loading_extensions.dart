import 'package:dartz/dartz.dart';
import 'package:exception_type/exception_type.dart';
import 'package:flutter/foundation.dart';
import 'package:i_tdd/i_tdd.dart';
import 'package:i_tdd/type_def/either_type_def.dart';

extension FutureDataLoadingExtension<R, P> on IEitherUseCase<R, P> {
  Future<void> loadFutureData({
    required VoidCallback onLoading,
    required VoidCallback onEmpty,
    required SuccessCallback onSuccess,
    required FailureCallback onFailed,
    required P params,
  }) async {
    try {
      debugPrint('$runtimeType | loadFutureData | ');
      onLoading();

      // load future data
      final Either<IFailure, R> eitherResponse = await this(params);

      // check eitherResponse report
      eitherResponse.handleReport(
          onSuccess: onSuccess, onFailed: onFailed, onEmpty: onEmpty);
    } catch (e) {
      handleError(
        onFailed: (message) => onFailed(message),
      );
    }
  }
}
