import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_bom_joia/app/domain/entities/pratos.dart';
import 'package:projeto_bom_joia/app/domain/interfaces/pratos_dao.dart';

class PratosDAOFirestore implements PratosDAO {
  CollectionReference pratosCollection;

  PratosDAOFirestore() {
    pratosCollection = FirebaseFirestore.instance.collection('pratos');
  }

  @override
  Future<List<Pratos>> find() async {
    var result = await pratosCollection.get();
    return result.docs
        .map((e) => Pratos(
            id: e.reference.id.toString(),
            nomePrato: e['nomePrato'],
            quantia: e['quantia'],
            urlAvatar: e['urlAvatar']))
        .toList();
  }

  @override
  remove(id) {
    pratosCollection.doc(id).delete();
  }

  @override
  save(Pratos pratos) {
    pratosCollection.doc(pratos.id).set({
      'nomePrato': pratos.nomePrato,
      'quantia': pratos.quantia,
      'urlAvatar': pratos.urlAvatar
    });
  }
}
