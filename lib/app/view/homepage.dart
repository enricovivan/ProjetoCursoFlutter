import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:projeto_bom_joia/app/database/sqlite/connection.dart';
import 'package:projeto_bom_joia/app/my_app.dart';
import 'package:projeto_bom_joia/app/view/cronometro_general.dart';
import 'package:sqflite/sqflite.dart';

class HomePage extends StatefulWidget {
  //const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

/*final listaPedidos = [
  {
    'nomePrato': 'Steak Tartare',
    'quantia': '2 Pratos',
    'fotoPrato':
        'https://www.lowcarbnikki.com/wp-content/uploads/2019/08/20190611_203100.jpg'
  },
  {
    'nomePrato': 'Pidan',
    'quantia': '4 Porções',
    'fotoPrato':
        'https://www.onlinepasar.com.my/wp-content/uploads/2020/02/Century-Egg-Pidan.jpg'
  },
  {
    'nomePrato': 'Pato no Tucupi',
    'quantia': '2 Pratos',
    'fotoPrato':
        'https://t2.rg.ltmcdn.com/pt/images/4/1/9/img_pato_no_tucupi_paraense_2914_orig.jpg'
  },
];*/

Future<List<Map<String, dynamic>>> _buscar() async {
  Database db = await Connection.get();

  return db.query('pratos');
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _buscar(),
      builder: (context, futuro) {
        if (futuro.hasData) {
          var lista = futuro.data;
          return Scaffold(
              appBar: AppBar(
                title: Text('Home'),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(MyApp.FAVORITOS);
                      },
                      icon: Icon(Icons.favorite)),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(MyApp.PEDIDOS_FORM);
                      },
                      icon: Icon(Icons.add)),
                ],
              ),
              body: ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (context, i) {
                    var prato = lista[i];
                    var foto = CircleAvatar(
                        backgroundImage: NetworkImage(prato['url_avatar']));
                    return ListTile(
                      leading: foto,
                      title: Text(prato['nomePrato']),
                      subtitle: Text(prato['quantia']),
                      trailing: Container(
                        width: 100,
                        child: Row(children: [
                          IconButton(onPressed: null, icon: Icon(Icons.cancel)),
                          IconButton(onPressed: null, icon: Icon(Icons.timer)),
                        ]),
                      ),
                    );
                  }));
        } else {
          return Scaffold();
        }
      },
    );

    /**/
  }
}
