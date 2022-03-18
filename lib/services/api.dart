import 'dart:math';

import '../constants/failure_codes.dart';
import '../models/faliure.dart';

class Api {
  Future<int> simulateApiAction() async {
    await Future.delayed(Duration(milliseconds: 250));
    try {
      final data = Random().nextInt(5);
      if (data == 0) {
        throw Failure(
          code: FailureCodes.notFound,
          message: 'api error',
        );
      }
      return data;
    } on Failure {
      rethrow;
    } catch (e) {
      throw Failure(code: FailureCodes.unknownError, message: e.toString());
    }
  }
}
