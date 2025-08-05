import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:i_tdd/i_tdd.dart';
import 'package:i_tdd/type_def/either_type_def.dart';

extension StreamDataLoadingExtension<R, P> on IOptionStreamUseCase<R, P> {
  void loadStreamData({
    required VoidCallback onLoading,
    required VoidCallback onEmpty,
    required SuccessCallback onSuccess,
    required FailureCallback onFailed,
    required P params, // Add parameter for parameters (e.g., ProductListQuery)
  }) {
    try {
      debugPrint('$runtimeType | loadStreamData | ');
      onLoading();

      // load stream data
      final Option<Stream<R>> dataStreamOrVoid = this(params);

      // check stream report
      return dataStreamOrVoid.handleStreamData(
        onEmpty: onEmpty,
        onSuccess: onSuccess,
      );
    } catch (e) {
      handleError(onFailed: (message) => onFailed(message));
    }
  }
}
