class AnalysesModel {
  String? typeAnalyse;
  String? etatAnalyse;
  String? date;
  String? documentAnalyse;
  int? id_analyse;
  String? laboratoire;
  String? localisation;
  
  List<String>? nomResultats;
  List<String>? degre;
  List<String>? standard;

  static var obs;

  AnalysesModel(
      {this.typeAnalyse,
      this.etatAnalyse,
      this.date,
      this.documentAnalyse,
      this.laboratoire,
      this.localisation,
      this.nomResultats,
      this.degre,
      this.standard});

  AnalysesModel.fromJson(Map<String, dynamic> json) {
    typeAnalyse = json['type_analyse'];
    etatAnalyse = json['etat_analyse'];
    date = json['date'];
    id_analyse = json['id_analyse'];
    documentAnalyse = json['document_analyse'];
    laboratoire = json['laboratoire'];
    localisation = json['localisation'];
    nomResultats = json['nom_resultats'].toString().split(',');
    degre = json['degre'].toString().split(',');
    standard = json['standard'].toString().split(',');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type_analyse'] = this.typeAnalyse;
    data['etat_analyse'] = this.etatAnalyse;
    data['date'] = this.date;
    data['document_analyse'] = this.documentAnalyse;
    data['laboratoire'] = this.laboratoire;
    data['localisation'] = this.localisation;
    data['nom_resultats'] = this.nomResultats;
    data['degre'] = this.degre;
    data['standard'] = this.standard;
    return data;
  }
}