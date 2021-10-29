import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projeto_bom_joia/app/domain/entities/pratos.dart';
import 'package:projeto_bom_joia/app/view/homepage_back.dart';

import '../my_app.dart';

class Homepage extends StatelessWidget {
  final _back = HomepageBack();

  CircleAvatar circleAvatar(String url) {
    if (Uri.tryParse(url).isAbsolute) {
      return CircleAvatar(backgroundImage: NetworkImage(url));
    } else {
      return CircleAvatar(child: Icon(Icons.person));
    }
  }

  Widget botaoEditar(Function funcao) {
    return IconButton(
        onPressed: funcao, icon: Icon(Icons.edit), color: Colors.amberAccent);
  }

  Widget iconRemoveButton(BuildContext context, Function remove) {
    return IconButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text('Excluir'),
                    content: Text('Confirma a Exclusão?'),
                    actions: [
                      FlatButton(
                        child: Text('Não'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      FlatButton(
                        child: Text('Sim'),
                        onPressed: remove,
                      ),
                    ],
                  ));
        },
        icon: Icon(Icons.cancel),
        color: Colors.red);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Pedidos (Home)'),
          actions: [
            IconButton(
                onPressed: () {
                  _back.refreshList();
                },
                icon: Icon(Icons.refresh)),
            IconButton(
                onPressed: () {
                  //Navigator.of(context).pushNamed(MyApp.PEDIDOS_FORM);
                  _back.goToForm(context);
                },
                icon: Icon(Icons.add)),
          ],
        ),
        body: Observer(builder: (context) {
          return FutureBuilder(
            future: _back.list,
            builder: (context, futuro) {
              if (!futuro.hasData) {
                return CircularProgressIndicator();
              } else {
                List<Pratos> lista = futuro.data;
                return ListView.builder(
                    itemCount: lista.length,
                    itemBuilder: (context, i) {
                      var prato = lista[i];

                      return ListTile(
                        leading: circleAvatar(prato.urlAvatar),
                        title: Text(prato.nomePrato),
                        onTap: () {
                          _back.goToDetails(context, prato);
                        },
                        subtitle: Text(prato.quantia),
                        trailing: Container(
                          width: 100,
                          child: Row(children: [
                            botaoEditar(() {
                              _back.goToForm(context, prato);
                            }),
                            iconRemoveButton(context, () {
                              _back.remover(prato.id);
                              Navigator.of(context).pop();
                            })
                          ]),
                        ),
                      );
                    });
              }
            },
          );
        }));

    /**/
  }
}
