import 'package:dartz/dartz.dart';

import '../models/faliure.dart';

extension TaskX<T extends Either<Object, U>, U> on Task<T> {
  Task<Either<Failure, U>> mapFailure() {
    return map(
      (either) => either.leftMap((obj) {
        try {
          return obj as Failure;
        } catch (e) {
          throw obj;
        }
      }),
    );
  }
}
