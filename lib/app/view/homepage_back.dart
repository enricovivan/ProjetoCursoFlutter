import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:projeto_bom_joia/app/domain/entities/pratos.dart';
import 'package:projeto_bom_joia/app/domain/services/prato_service.dart';
import 'package:projeto_bom_joia/app/my_app.dart';

part 'homepage_back.g.dart';

class HomepageBack = _HomepageBack with _$HomepageBack;

abstract class _HomepageBack with Store {
  var _service = GetIt.I.get<PratoService>();

  //homepage
  @observable
  Future<List<Pratos>> list;

  //método para atualizar lista de pratos (homepage)
  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  _HomepageBack() {
    refreshList();
  }

  //metodo apra chamar o formulario (adicionar)
  goToForm(BuildContext context) {
    Navigator.of(context).pushNamed(MyApp.PEDIDOS_FORM).then(refreshList());
  }

  //metodo para chamar o timer (quanto tempo falta)

  //metodo para remover
  remover(dynamic id) {
    _service.remove(id);
    refreshList();
  }

  //método para abrir o prato
  goToDetails(BuildContext context, Pratos prato) {
    Navigator.of(context).pushNamed(MyApp.PEDIDOS_DETAILS, arguments: prato);
  }
}
