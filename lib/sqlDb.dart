import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDB {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDB();
      return _db;
    } else
      return _db;
  }

  initialDB() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'sasS.db');
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 2, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldversion, int newversion) async {
    db.execute("");
  }

  _onCreate(Database db, int version) async {
    Batch batch = db.batch();
    batch.execute('''
  create table "analyses"(
     "id" integer  primary key,
     "date_analyse" Text ,
     "etat" Text ,
     "type" Text ,
     "id_laboratoire" integer , 
     "id_consultation" integer,
     "document" Text
  );
''');
    batch.execute('''
  create table "laboratoire"(
     "id" integer  primary key,
     "nom_laboratoir" Text ,
     "localisation" Text 
  );
''');
    batch.execute('''
  create table "resultat_analyses"(
    "id" integer  primary key,
    "id_analyse" integer,
    "nom" Text ,
    "degree" integer ,
     "standard" Text 
  );
''');

    batch.execute('''
  create table "etudiant"(
    "code" integer  primary key,
    "id_compte" integer ,  
    "nom" Text ,
    "prenom" Text ,
     "sexe" Text ,
     "date_naissance" Text ,
     "telephone" Text , 
     "email" Text , 
     "Group_sanguin" Text ,
     "Url_image" Text
  );
''');
    batch.execute('''
  create table "compte"(
    "id" integer  primary key,
    "email" Text,
    "password" integer 
  );
''');
    batch.execute('''
  create table "consultation"(
    "id" integer  primary key,
    "etat" Text ,
    "lieu" Text ,
    "date_consultation" Text ,
    "id_etudiant" integer , 
    "id_medcin" integer , 
    "id_traitement" integer , 
    "id_diagnostic" integer 
  );
''');
    batch.execute('''
  INSERT INTO 'analyses' VALUES 
  (1,'12/01/2020','Normal','Blood Test','1' , 1 , "BT") , 
  (2,'12/02/2020','Deviation','Cancer Screening','1' , 2 ,"CS"),
  (3,'12/01/2022','Normal','Blood Test','1' , 1 , "BT") ,
  (4,'12/01/2021','Normal','Cancer Screening','3' , 2 , "BT") ,
  (5,'12/07/2020','Normal','Cancer Screening','3' , 1 , "BT") ,
  (6,'12/07/2021','Normal','Blood Test','2' , 2 , "BT") ,
  (7,'12/01/2023','Normal','Cancer Screening','1' , 1 , "BT") ,
  (8,'12/01/2023','Normal','Blood Test','4' , 3 ,"BT") ,
  (9,'12/01/2023','Normal','Cancer Screening','4' , 3 , "BT") ,
  (10,'12/01/2023','Normal','Blood Test','2'  , 3 , "BT") 
  ; 
''');
    batch.execute('''
  INSERT INTO 'laboratoire' VALUES 
  (1,'labo1','rabat') , 
  (2,'labo2','sale'),
  (3,'labo3','tamsna') ,
  (4,'labo4','temara') 
  ;
''');
    batch.execute('''
  INSERT INTO 'consultation' VALUES 
  (1,'bonne','rabar','12/01/2023',1,1,1,2) , 
  (2,'bonne','sale','12/07/2020',1,1,1,2) ,
  (3,'bonne','sale','12/07/2020',2,1,1,2) 
  ;
''');
    batch.execute('''
  INSERT INTO 'resultat_analyses' VALUES 
  (1,1,'Glucose',2.4,'3-4') , 
  (2,1,'Hemoglobine',2.1,'3-4') ,
  (3,1,'Cholestrol',2.4,'3-4'),
   (4,2,'Amino acids',2.7,'3-4') ,
   (5,2,'Lipid',2.7,'3-4')
  ;
''');

    batch.execute('''
  INSERT INTO 'etudiant' VALUES 
     (1,1,'ilias','maazouz','M','28/07/2002','0666666','GGG@GG.COM','a','sdsdsd') ,
     (2,2,'amine','hhh','M','28/07/2002','0666666','GGG@GG.COM','a','sdsdsd') 
  ;
''');

    batch.execute('''
  INSERT INTO 'compte' VALUES 
     (1,'ilias@gmail.com',123) ,
     (2,'amine@gmail.com',456) 
  ;
''');

    await batch.commit();
  }

  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }
}
