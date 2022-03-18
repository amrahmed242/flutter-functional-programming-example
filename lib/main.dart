import '../../constants/failure_codes.dart';
import '../../extensions/task_excuter.dart';
import '../../models/faliure.dart';
import '../../services/api.dart';

main() async {
  final task = Api().simulateApiAction();
  await task.excute(
    onFailed: onFetchFailed,
    onSuccess: onFetchSuccessed,
  );
}

onFetchFailed(Failure failure) {
  //recive failures and handle them
  print('recived error:' + failure.toString());

  if (failure.code == FailureCodes.noNetwork) {
    //do something special with specifc failure
  }
}

onFetchSuccessed(int data) {
  //do what you like from here
  print('final data $data');
}
