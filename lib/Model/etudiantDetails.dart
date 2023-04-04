class EtudiantDetails {
  Etudiant? etudiant;
  List<Analyses>? analyses;

  EtudiantDetails({this.etudiant, this.analyses});

  EtudiantDetails.fromJson(Map<String, dynamic> json) {
    etudiant = json['etudiant'] != null
        ? new Etudiant.fromJson(json['etudiant'])
        : null;
    if (json['analyses'] != null) {
      analyses = <Analyses>[];
      json['analyses'].forEach((v) {
        analyses!.add(new Analyses.fromJson(v));
      });
    }
  }
}

class Etudiant {
  int? idEtudiant;
  CodeApoge? codeApoge;
  String? referenceEtablissement;
  String? telephone;
  String? numTuteur;
  String? email;
  String? anneeUniversitaire;
  String? fillier;
  String? adresse;

  Etudiant(
      {this.idEtudiant,
      this.codeApoge,
      this.referenceEtablissement,
      this.telephone,
      this.numTuteur,
      this.email,
      this.anneeUniversitaire,
      this.fillier,
      this.adresse});

  Etudiant.fromJson(Map<String, dynamic> json) {
    idEtudiant = json['id_etudiant'];
    codeApoge = json['code_apoge'] != null
        ? new CodeApoge.fromJson(json['code_apoge'])
        : null;
    referenceEtablissement = json['reference_etablissement'];
    telephone = json['telephone'];
    numTuteur = json['num_tuteur'];
    email = json['email'];
    anneeUniversitaire = json['annee_universitaire'];
    fillier = json['fillier'];
    adresse = json['adresse'];
    print(fillier);
    print(adresse);
  }
}

class CodeApoge {
  int? id;
  String? codeApoge;
  String? codeMassar;
  String? nomLatin;
  String? prenomLatin;
  String? nomArabe;
  String? prenomArabe;
  String? genre;
  String? dateNaissance;
  String? groupSanguin;
  String? urlImage;

  CodeApoge(
      {this.id,
      this.codeApoge,
      this.codeMassar,
      this.nomLatin,
      this.prenomLatin,
      this.nomArabe,
      this.prenomArabe,
      this.genre,
      this.dateNaissance,
      this.groupSanguin,
      this.urlImage});

  CodeApoge.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    codeApoge = json['code_apoge'];
    codeMassar = json['code_massar'];
    nomLatin = json['nom_latin'];
    prenomLatin = json['prenom_latin'];
    nomArabe = json['nom_arabe'];
    prenomArabe = json['prenom_arabe'];
    genre = json['genre'];
    dateNaissance = json['date_naissance'];
    groupSanguin = json['group_sanguin'];
    urlImage = json['url_image'];
  }
}

class Analyses {
  String? referenceAnalyse;
  String? dateAnalyse;
  String? etatAnalyse;
  String? typeAnalyse;
  String? analyseDocument;
  int? idEtudiant;
  String? referenceLabo;
  List<ResultatAnalyses>? resultatAnalyses;
  List<Laboratoires>? laboratoires;

  Analyses(
      {this.referenceAnalyse,
      this.dateAnalyse,
      this.etatAnalyse,
      this.typeAnalyse,
      this.analyseDocument,
      this.idEtudiant,
      this.referenceLabo,
      this.resultatAnalyses,
      this.laboratoires});

  Analyses.fromJson(Map<String, dynamic> json) {
    referenceAnalyse = json['reference_analyse'];
    dateAnalyse = json['date_analyse'];
    etatAnalyse = json['etat_analyse'];
    typeAnalyse = json['type_analyse'];
    analyseDocument = json['analyse_document'];
    idEtudiant = json['id_etudiant'];
    referenceLabo = json['reference_labo'];
    if (json['resultat_analyses'] != null) {
      resultatAnalyses = <ResultatAnalyses>[];
      json['resultat_analyses'].forEach((v) {
        resultatAnalyses!.add(new ResultatAnalyses.fromJson(v));
      });
    }
    if (json['laboratoires'] != null) {
      laboratoires = <Laboratoires>[];
      json['laboratoires'].forEach((v) {
        laboratoires!.add(new Laboratoires.fromJson(v));
      });
    }
  }
}

class ResultatAnalyses {
  int? idResultat;
  String? nomResultat;
  String? degre;
  String? standart;
  String? unite;
  String? referenceAnalyse;

  ResultatAnalyses(
      {this.idResultat,
      this.nomResultat,
      this.degre,
      this.standart,
      this.unite,
      this.referenceAnalyse});

  ResultatAnalyses.fromJson(Map<String, dynamic> json) {
    idResultat = json['id_resultat'];
    nomResultat = json['nom_resultat'];
    degre = json['degre'];
    standart = json['standart'];
    unite = json['unite'];
    referenceAnalyse = json['reference_analyse'];
  }
}

class Laboratoires {
  String? referenceLabo;
  String? nomLabo;
  String? localisation;
  String? adresseLabo;

  Laboratoires(
      {this.referenceLabo, this.nomLabo, this.localisation, this.adresseLabo});

  Laboratoires.fromJson(Map<String, dynamic> json) {
    referenceLabo = json['reference_labo'];
    nomLabo = json['nom_labo'];
    localisation = json['localisation'];
    adresseLabo = json['adresse_labo'];
  }
}
