import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projeto_bom_joia/app/domain/entities/pratos.dart';
import 'package:projeto_bom_joia/app/my_app.dart';
import 'package:projeto_bom_joia/app/view/homepage_back.dart';

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

class _HomePageState extends State<HomePage> {
  final _back = HomepageBack();

  CircleAvatar circleAvatar(String url) {
    if (Uri.tryParse(url).isAbsolute) {
      return CircleAvatar(backgroundImage: NetworkImage(url));
    } else {
      return CircleAvatar(child: Icon(Icons.person));
    }
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
          title: Text('Home'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(MyApp.FAVORITOS);
                },
                icon: Icon(Icons.favorite)),
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
                            IconButton(
                                onPressed: null, icon: Icon(Icons.timer)),
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
