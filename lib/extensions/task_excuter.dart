import 'package:dartz/dartz.dart';

import '../../models/faliure.dart';
import 'task_fail_mapper.dart';

extension TaskExcuter<T> on Future<T> {
  Future<void> excute({
    Function(Failure f)? onFailed,
    Function(T value)? onSuccess,
  }) async {
    return await Task(() => this).attempt().mapFailure().run().then((o) {
      return o.fold(
        (f) async {
          try {
            if (onFailed != null) await onFailed(f);
          } catch (e) {
            print(e);
          }
        },
        (s) async {
          try {
            if (onSuccess != null) await onSuccess(s);
          } catch (e) {
            print(e);
          }
        },
      );
    });
  }
}
