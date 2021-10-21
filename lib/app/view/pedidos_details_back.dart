import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_bom_joia/app/domain/entities/pratos.dart';
import 'package:url_launcher/url_launcher.dart';

class PedidosDetailsBack {
  BuildContext context;
  Pratos pratos;

  PedidosDetailsBack(this.context) {
    pratos = ModalRoute.of(context).settings.arguments;
  }

  goToBack() {
    Navigator.of(context).pop();
  }

  _lauchApp(String url, Function(BuildContext context) showModalError) async {
    await canLaunch(url) ? await launch(url) : showModalError(context);

    /*showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('ALERTA!'),
                content: Text('Não foi possível encontrar um APP compatível'),
              );
            });*/
  }

  launchInternet(Function(BuildContext context) showModalError) {
    _lauchApp('${pratos.urlAvatar}', showModalError);
  }
}
