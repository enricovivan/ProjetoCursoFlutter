import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:projeto_bom_joia/app/domain/entities/pratos.dart';
import 'package:projeto_bom_joia/app/domain/services/prato_service.dart';

part 'pedidos_form_back.g.dart';

class PedidosFormBack = _PedidosFormBack with _$PedidosFormBack;

abstract class _PedidosFormBack with Store {
  Pratos pratos;
  var _service = GetIt.I.get<PratoService>();
  bool _nameIsValid;
  bool _quantiaIsValid;

  bool get isValid => _nameIsValid && _quantiaIsValid;
  @action
//diferenciar novo de alteração
  _PedidosFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context).settings.arguments;
    pratos = (parameter == null) ? Pratos() : parameter;
  }

//salvar
  save() async {
    await _service.save(pratos);
  }

//validações
  String validateName(String nome) {
    try {
      _service.validarNome(nome);
      _nameIsValid = true;
      return null;
    } catch (e) {
      _nameIsValid = false;
      return e.toString();
    }
  }

  String validateQuantia(String quantia) {
    try {
      _service.validarQuantia(quantia);
      _quantiaIsValid = true;
      return null;
    } catch (e) {
      _quantiaIsValid = false;
      return e.toString();
    }
  }
}
