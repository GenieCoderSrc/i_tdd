import 'package:app_toast/app_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:exception_type/exception_type.dart';
import 'package:flutter/foundation.dart';
import 'package:i_tdd/type_def/either_type_def.dart';

extension ResultEitherExtensions<L, R> on Either<L, R> {
  /// This handles Either and returns the success result if available
  Future<R?> handleReport({
    String? successMsg,
    String? emptyListMsg,
    bool isDisplayFailedMsg = false,
    FailureCallback? onFailed,
    SuccessCallback<R>? onSuccess,
    VoidCallback? onEmpty,
  }) async {
    try {
      return fold(
        (L l) {
          final String message = mapFailureToMessage(l as IFailure);
          debugPrint('ResultEitherExtensions | handleReport | error: $message');

          if (isDisplayFailedMsg) {
            AppToast.showToast(msg: message);
          }

          onFailed?.call(message);
          return null;
        },
        (R successReport) {
          debugPrint(
            'ResultEitherExtensions | handleReport | success: $successReport',
          );

          if (successReport is List && successReport.isEmpty) {
            AppToast.showToast(msg: emptyListMsg ?? "No data available.");
            onEmpty?.call();
            return null;
          }

          if (successMsg != null) {
            AppToast.showToast(msg: successMsg);
          }

          onSuccess?.call(successReport);
          return successReport;
        },
      );
    } catch (e, stackTrace) {
      debugPrint('ResultEitherExtensions | handleReport | exception: $e');
      debugPrint('$stackTrace');
      return null;
    }
  }
}
