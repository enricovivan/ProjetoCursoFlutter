import 'package:flutter/material.dart';
import 'package:projeto_bom_joia/app/view/pedidos_form_back.dart';

class PedidosForm extends StatelessWidget {
  //const PedidosForm({ Key? key }) : super(key: key);
  final _form = GlobalKey<FormState>();

  Widget nomeCampo(PedidosFormBack back) {
    return TextFormField(
      initialValue: back.pratos.nomePrato,
      validator: back.validateName,
      onSaved: (newValue) => back.pratos.nomePrato = newValue,
      decoration: InputDecoration(
          labelText: 'Nome do Prato', hintText: 'Pato no Tucupi'),
    );
  }

  Widget quantidade(PedidosFormBack back) {
    return TextFormField(
      initialValue: back.pratos.quantia,
      validator: back.validateQuantia,
      onSaved: (newValue) => back.pratos.quantia = newValue,
      decoration: InputDecoration(
          labelText: 'Quantidade', hintText: '2 Pratos | 3 unidades'),
    );
  }

  Widget url(PedidosFormBack back) {
    return TextFormField(
      initialValue: back.pratos.urlAvatar,
      onSaved: (newValue) => back.pratos.urlAvatar = newValue,
      decoration: InputDecoration(
          labelText: 'Link da Imagem',
          hintText: 'https://imagem.com.br/image.png'),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _back = PedidosFormBack(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Pedidos'),
        actions: [
          IconButton(
              onPressed: () {
                _form.currentState.validate();
                _form.currentState.save();
                if (_back.isValid) {
                  _back.save();
                  Navigator.of(context).pop();
                }
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
            key: _form,
            child: Column(
              children: [nomeCampo(_back), quantidade(_back), url(_back)],
            )),
      ),
    );
  }
}
