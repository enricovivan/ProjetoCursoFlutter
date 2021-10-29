import 'package:projeto_bom_joia/app/database/sqlite/connection.dart';
import 'package:projeto_bom_joia/app/domain/entities/pratos.dart';
import 'package:projeto_bom_joia/app/domain/interfaces/pratos_dao.dart';
import 'package:sqflite/sqflite.dart';

class PratosDAOImpl implements PratosDAO {
  Database _db;

  @override
  Future<List<Pratos>> find() async {
    _db = await Connection.get();

    List<Map<String, dynamic>> resultado = await _db.query('pratos');

    List<Pratos> lista = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return Pratos(
        id: linha['id'],
        nomePrato: linha['nomePrato'],
        quantia: linha['quantia'],
        urlAvatar: linha['url_avatar'],
      );
    });

    return lista;
  }

  @override
  remove(dynamic id) async {
    _db = await Connection.get();
    var sql = 'DELETE FROM pratos WHERE id = ?';
    _db.rawDelete(sql, [id]);
  }

  @override
  save(Pratos pratos) async {
    _db = await Connection.get();
    var sql;

    if (pratos.id == null) {
      sql =
          'INSERT INTO pratos (nomePrato, quantia, url_avatar) VALUES (?,?,?)';
      _db.rawInsert(sql, [pratos.nomePrato, pratos.quantia, pratos.urlAvatar]);
    } else {
      sql =
          'UPDATE pratos SET nomePrato = ?, quantia = ?, url_avatar = ? WHERE id = ?';
      _db.rawUpdate(
          sql, [pratos.nomePrato, pratos.quantia, pratos.urlAvatar, pratos.id]);
    }
  }
}
