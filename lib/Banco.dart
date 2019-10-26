import 'package:sqflite/sqflite.dart';


import 'dart:io';

import 'package:path/path.dart';



Database db;

class Banco{
  static const tagTable = "tag";//Tabela TAG
    static const idTag = "id";//id da tag
    static const nomeTag = "nome";//nome da tag


    static const gastoTable = "gasto";//Tabela Gasto
      static const idGasto = "id";
      static const descrGasto = "descr";
      static const codTagGasto = "codTag";//Chave estrangeira do Tag
      static const precoGasto = "preco";
      static const dataGasto = "dat";


      static const ganhoTable = "ganho";//Tabela Gasto
      static const idGanho = "id";
      static const descrGanho = "descr";
      static const codTagGanho = "codTag";//Chave estrangeira do Tag
      static const precoGanho = "preco";
      static const dataGanho = "dat";



    static void databaseLog(String functionName, String sql,
    [List<Map<String, dynamic>> selectQueryResult, int insertAndUpdateQueryResult]){

      print(functionName);
      print(sql);
      if(selectQueryResult != null){
        print(selectQueryResult);
      }
      else if(insertAndUpdateQueryResult != null){
        print(insertAndUpdateQueryResult);
      }
    }


    Future<void> createTagTable(Database db) async{//Criando Tabela TAG
        final tagSql = '''CREATE TABLE $tagTable(
          $idTag INTEGER PRIMARY KEY,
          $nomeTag TEXT
        )''';

        await db.execute(tagSql);
    }

    Future<void> createGastoTable(Database db) async{
      final gastoSql = '''CREATE TABLE $gastoTable(
        $idGasto INTERGER PRIMARY KEY,
        $descrGasto text,
        $codTagGasto int references $idTag,
        $precoGasto real,
        $dataGasto timestamp default CURRENT_TIMESTAMP

      )''';
      await db.execute(gastoSql);
    }

     Future<void> createGanhoTable(Database db) async{
      final ganhoSql = '''CREATE TABLE $ganhoTable(
        $idGanho INTERGER PRIMARY KEY,
        $descrGanho text,
        $codTagGanho int references $idTag,
        $precoGanho real,
        $dataGanho timestamp default CURRENT_TIMESTAMP

      )''';
      await db.execute(ganhoSql);
    }


    Future<String> getDatabasePath(String dbName) async {//Criando folder do banco interno
      final databasePath = await getDatabasesPath();
      final path = join(databasePath, dbName);

      if(await Directory(dirname(path)).exists()){//Faz questão se o arquivo existe
          //await deleteDatabase(path);
      }
      else{
        await Directory(dirname(path)).create(recursive: true);
      }
      return path;
    }

    Future<void> initDatabase() async{//abrindo a database
      final path = await getDatabasePath('ekonomy_db');
      db = await openDatabase(path, version: 1, onCreate: onCreate);
      print(db);
    }

    Future<void> onCreate(Database db,int version) async{
        await createTagTable(db);
        await createGastoTable(db);
        await createGanhoTable(db);
    }



}