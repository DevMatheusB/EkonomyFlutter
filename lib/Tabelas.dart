import 'dart:convert';

import 'package:sqflite/sqflite.dart';
import 'Banco.dart';

class Tag{
  int id;
  String nome;
  

  Tag(this.id,this.nome);

  Tag.fromJson(Map<String, dynamic> json){
    this.id = json[Banco.idTag];
    this.nome = json[Banco.nomeTag];
  }
} 

class Gasto{
  int id;
  String descr;
  int codtag;
  double preco;
  String dat;

  Gasto.fromJson(Map<String, dynamic> json){
    this.id = json[Banco.idGasto];
    this.descr = json[Banco.descrGasto];
    this.codtag = json[Banco.codTagGasto];
    this.preco = json[Banco.precoGasto];
    this.dat = json[Banco.dataGasto];
  }
       
}

class Ganho{
  int id;
  String descr;
  int codtag;
  double preco;
  String dat;

  Ganho.fromJson(Map<String, dynamic> json){
    this.id = json[Banco.idGanho];
    this.descr = json[Banco.descrGanho];
    this.codtag = json[Banco.codTagGanho];
    this.preco = json[Banco.precoGanho];
    this.dat = json[Banco.dataGanho ];
  }
       
}