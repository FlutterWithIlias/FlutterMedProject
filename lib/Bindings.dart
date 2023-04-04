import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:medical_app/ViewModel/AnalysesViewModel.dart';
import 'package:medical_app/ViewModel/LoginViewModel.dart';

import 'Repository/GetDataSqlite.dart';
import 'ViewModel/AnalysesResultsViewModel.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    LoginViewModel login =
        Get.put(LoginViewModel(repository: LoginSqlite()), permanent: true);
    Get.lazyPut(
        () => AnalysesViewModel(repository: LoginSqlite(), id: login.code!),
        fenix: true);
    Get.lazyPut(() => AnalysesResultsViewModel(), fenix: true);
  }
}
