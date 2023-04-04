import 'package:get/get.dart';
import 'package:medical_app/Model/AnalysesModel.dart';

import '../Model/etudiantDetails.dart';
import '../Repository/Repository.dart';

class AnalysesViewModel extends GetxController {
  var etud = EtudiantDetails().obs;
  int id;
  var check = 0.obs;
  Repository? repository;

  static var obs;
  AnalysesViewModel({this.repository, required this.id});
  fetchAllAnalyses() async {
    var et = await repository!.getEtudiant();
    etud.value = et;
    check.value = 1;
    print(etud.value.analyses!.length);
    print("$check");
    print(etud.value.etudiant!.email);
    print(etud.value.etudiant!.anneeUniversitaire);
  }

  @override
  void onInit() async {
    fetchAllAnalyses();
    super.onInit();
  }
}
