import 'dart:convert';

import 'package:medical_app/Model/AnalysesModel.dart';
import 'package:http/http.dart' as http;
import '../Model/LoginModel.dart';
import '../Model/etudiantDetails.dart';
import '../sqlDb.dart';
import 'Repository.dart';

class LoginSqlite extends Repository {
  List<LoginModel> loginInfos = [];
  List<AnalysesModel> analyses = [];
  EtudiantDetails et = EtudiantDetails();
  @override
  Future<List<LoginModel>> getLoginInfos() async {
    SqlDB sqldb = SqlDB();
    try {
      var response = await sqldb.readData(
          "Select 'e'.'code' as 'code' , 'c'.'email' as 'email' , 'c'.'password' as 'password' FROM 'etudiant' 'e' inner join 'compte' 'c' on 'e'.'id_compte' = 'c'.'id' ");
      List lista = response as List;
      loginInfos = lista.map((e) => LoginModel.fromJson(e)).toList();
    } catch (exception) {
      print("error");
    }

    return loginInfos;
  }

  @override
  Future<List<AnalysesModel>> getAnalysesById(int id) async {
    SqlDB sqldb = SqlDB();
    try {
      var response = await sqldb.readData(
          "select 'id_etudiant' as 'id_etudiant','l'.'localisation' as 'localisation','a'.'id' as 'id_analyse','a'.'date_analyse'as 'date','a'.'type' as 'type_analyse','l'.'nom_laboratoir' as 'laboratoire','a'.'etat' as 'etat_analyse','a'.'document' as 'document_analyse', group_concat(nom) as 'nom_resultats',group_concat(degree)  as 'degre',group_concat(standard)  as 'standard' from 'laboratoire' 'l','analyses' 'a','resultat_analyses' 'r' ,'consultation' 'c' where 'a'.'id_laboratoire'='l'.'id' and 'a'.'id' ='r'.'id_analyse' and 'c'.'id'='a'.'id_consultation' and 'c'.'id_etudiant'=$id  group by 'a'.'id' ");
      List lista = response as List;
      analyses = lista.map((e) => AnalysesModel.fromJson(e)).toList();
    } catch (exception) {
      print("error");
    }
    return analyses;
  }

  @override
  Future<EtudiantDetails> getEtudiant() async {
    final response =
        await http.get(Uri.parse('http://192.168.11.110:8000/api/et/all/1/'));
    et = EtudiantDetails.fromJson(jsonDecode(response.body));
    return et;
  }
}
