import 'package:dartz/dartz.dart';
import 'package:exceptions/error_msg/map_failure_to_msg.dart';
import 'package:exceptions/i_errors/i_failure.dart';
import 'package:flutter/foundation.dart';
import 'package:i_tdd/type_def/either_type_def.dart';
import 'package:app_toast/app_toast.dart';

extension ReportEitherExtensions<L, R> on Either<L, R> {
  handleReport({
    FailureCallback? onFailed,
    SuccessCallback<R>? onSuccess,
    VoidCallback? onEmpty,
    String? successMsg,
    String? emptyListMsg,
    bool isDisplayFailedMsg = false,
  }) {
    try {
      fold(
        (L l) {
          final String message = mapFailureToMessage(l as IFailure);
          debugPrint('ReportEitherExtensions | handleReport | error: $message');
          if (isDisplayFailedMsg) {
            AppToast.showToast(msg: message);
          }
          if (onFailed != null) {
            return onFailed(message);
          }
        },
        (R successReport) {
          debugPrint(
              'ReportEitherExtensions | handleReport | successReport: $successReport');
          if (successReport is List<R> && successReport.isEmpty) {
            // Execute onEmpty callback when the list is empty

            AppToast.showToast(msg: emptyListMsg ?? "No List Available");
            if (onEmpty != null) {
              return onEmpty();
            }
          } else {
            if (successMsg != null) {
              AppToast.showToast(msg: successMsg);
            }
            if (onSuccess != null) {
              return onSuccess(successReport);
            }
          }
        },
      );
    } catch (e) {
      debugPrint('ReportEitherExtensions | handleReport | error: $e');
    }
  }
}
