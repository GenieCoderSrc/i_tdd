import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:i_tdd/type_def/either_type_def.dart';

extension StreamDataHandlingExtension<R> on Option<Stream<R>> {
  void handleStreamData({
    required VoidCallback onEmpty,
    required SuccessCallback onSuccess,
  }) {
    fold(onEmpty, (streamData) {
      debugPrint(
        'StreamDataHandlingExtension | handleStreamData | successReport: ${streamData.length}',
      );
      streamData.listen((R data) {
        debugPrint(
          'StreamDataHandlingExtension | handleStreamData | data length: ${data.toString()}',
        );
        onSuccess(data);
      });
    });
  }
}
