import 'package:medical_app/Model/AnalysesModel.dart';

import '../Model/LoginModel.dart';
import '../Model/etudiantDetails.dart';

abstract class Repository {
  Future<List<LoginModel>> getLoginInfos();
  Future<List<AnalysesModel>> getAnalysesById(int id);
  Future<EtudiantDetails> getEtudiant();
}
