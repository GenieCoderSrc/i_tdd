import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:i_tdd/type_def/either_type_def.dart';
import 'package:app_toast/app_toast.dart';

extension ErrorHandlingExtension on Object {
  void handleError({
    String? defaultMessage,
    FailureCallback? onFailed,
    bool isDisplayFailedMsg = false,
  }) {
    String message = (this is SocketException)
        ? (this as SocketException).message
        : defaultMessage ?? 'Ops! Something wrong';

    debugPrint('CubitErrorHandlingExtension | handleError | error: $message');

    if (isDisplayFailedMsg) {
      AppToast.showToast(msg: message);
    }
    if (onFailed != null) {
      onFailed(message);
    }
  }
}
