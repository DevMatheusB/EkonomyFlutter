import 'package:ekonomyapp/Tabelas.dart';

import 'Banco.dart';



class TagDAO{
  static Future<List<Tag>> getAllTag() async{
    final sql = '''Select  ${Banco.nomeTag} from ${Banco.tagTable}''';
    final data = await db.rawQuery(sql);
    List<Tag> tags = List();

    for(final node in data){
      final tag = Tag.fromJson(node);
      tags.add(tag);
    }
    return tags;
  }

  static Future<Tag> getTag(int id) async{
    final sql = ''' select * from ${Banco.tagTable} where ${Banco.idTag} == $id''';
    final data = await db.rawQuery(sql);

    final tag = Tag.fromJson(data[0]);
    return tag;
  }

  static Future<void> addTag(Tag tag) async{
       final sql = '''INSERT INTO ${Banco.tagTable}
    (
      ${tag.id},
      ${tag.nome},
    )
    VALUES (?,?,?,?)''';
    List<dynamic> params = [tag.id, tag.nome];
    final result = await db.rawInsert(sql, params);
    Banco.databaseLog('Tag adicionada!', sql);
  } 


  static Future<void> deleteTag(Tag tag) async{
    final sql = '''Delete from ${Banco.tagTable} where ${Banco.idTag} = ${tag.id}
    ''';
  
    Banco.databaseLog('Tag deletada!', sql);
  }


  
  static Future<void> updateTag(Tag tag) async{
    final sql = '''Update ${Banco.tagTable} set ${Banco.nomeTag} where ${Banco.idTag} == ${tag.id}    ''';
//https://youtu.be/9D1VX6uGylU?t=591
    
  
    Banco.databaseLog('Tag Atualizada!', sql);
  }


}