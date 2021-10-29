import 'package:projeto_bom_joia/app/domain/entities/pratos.dart';

abstract class PratosDAO {
  save(Pratos pratos);

  remove(dynamic id);

  Future<List<Pratos>> find();
}
