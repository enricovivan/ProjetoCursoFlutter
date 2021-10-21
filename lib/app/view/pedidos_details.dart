import 'package:flutter/material.dart';
import 'package:projeto_bom_joia/app/domain/entities/pratos.dart';
import 'package:projeto_bom_joia/app/view/pedidos_details_back.dart';

class PedidosDetails extends StatelessWidget {
  showModalError(BuildContext context) {
    var alert = AlertDialog(
      title: Text('ALERTA!'),
      content: Text('Não foi possível encontrar um App compatível'),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  @override
  Widget build(BuildContext context) {
    var _back = PedidosDetailsBack(context);
    Pratos pratos = _back.pratos;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      var width = constraints.biggest.width;
      var radius = width / 3;
      var height = constraints.biggest.height;

      return Scaffold(
        body: ListView(
          padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 60),
          children: [
            (Uri.tryParse(pratos.urlAvatar).isAbsolute)
                ? CircleAvatar(
                    backgroundImage: NetworkImage(pratos.urlAvatar),
                    radius: radius,
                  )
                : CircleAvatar(
                    child: Icon(
                      Icons.person,
                      size: width / 3,
                    ),
                    radius: radius,
                  ),
            Center(
              child: Text(
                '${pratos.nomePrato}',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Quantidade:'),
                subtitle: Text('${pratos.quantia}'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('URL:'),
                subtitle: Text('${pratos.urlAvatar}'),
                trailing: Container(
                  width: width / 8,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          _back.launchInternet(showModalError);
                        },
                        icon: Icon(Icons.wallpaper_sharp),
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('ID:'),
                subtitle: Text('${pratos.id}'),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back),
          onPressed: () {
            _back.goToBack();
          },
        ),
      );
    });
  }
}
