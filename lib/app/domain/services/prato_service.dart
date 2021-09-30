//serviço da camada de domínio

import 'package:get_it/get_it.dart';
import 'package:projeto_bom_joia/app/domain/entities/pratos.dart';
import 'package:projeto_bom_joia/app/domain/exception/domain_layer_exception.dart';
import 'package:projeto_bom_joia/app/domain/interfaces/pratos_dao.dart';

class PratoService {
  //var dao = PratosDAOImpl(); //dao sqlite (tecnologia específica)
  //dao de qualquer um desde que tenhamos definidas as operações no pratos dao
  var _dao = GetIt.I.get<PratosDAO>();

  //Regras de negócio: Salvar um prato, alterar ele, excluir e listar
  save(Pratos pratos) {
    validarNome(pratos.nomePrato);
    validarQuantia(pratos.quantia);
    _dao.save(pratos);
  }

  remove(int id) {
    _dao.remove(id);
  }

  Future<List<Pratos>> find() {
    return _dao.find();
  }

  //nome -> min 1 max 211
  validarNome(String nome) {
    var min = 1;
    var max = 211;

    if (nome == null) {
      throw DomainLayerException('O nome é obrigatório');
    } else if (nome.length < min) {
      throw DomainLayerException(
          'O nome é muito pequeno, e deve possuir pelo menos $min caractere(s)');
    } else if (nome.length > max) {
      throw DomainLayerException(
          'O Nome é muito grande (ultrapassou $max caracteres)');
    }
  }

  //quantia -> min 1 max 30
  validarQuantia(String quantia) {
    var min = 1;
    var max = 30;

    if (quantia == null) {
      throw DomainLayerException('É necessário especificar uma quantia');
    } else if (quantia.length < min) {
      throw DomainLayerException('Quantia muito pequena, o mínimo é $min');
    } else if (quantia.length > max) {
      throw DomainLayerException('Quantia excedida, o máximo é $max');
    }
  }
}
