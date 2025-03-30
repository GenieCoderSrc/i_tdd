import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:i_tdd/i_tdd.dart';
import 'package:i_tdd/type_def/either_type_def.dart';

extension FutureStreamDataLoadingExtension<R, P>
    on IFutureOptionStreamUseCase<R, P> {
  void loadStreamData({
    required VoidCallback onLoading,
    required VoidCallback onEmpty,
    required SuccessCallback onSuccess,
    required FailureCallback onFailed,
    required P params,
  }) {
    try {
      debugPrint('$runtimeType | loadFutureStreamData | ');
      onLoading();

      // load future stream data
      final Future<Option<Stream<R>>> dataStreamOrVoid = this(params);

      dataStreamOrVoid.then((dataStreamOption) {
        dataStreamOption.handleStreamData(
          onEmpty: onEmpty,
          onSuccess: onSuccess,
        );
      }).catchError((e) {
        handleError(
          onFailed: (message) => onFailed(message),
        );
      });
    } catch (e) {
      handleError(
        onFailed: (message) => onFailed(message),
      );
    }
  }
}
