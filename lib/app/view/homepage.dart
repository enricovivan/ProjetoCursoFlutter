import 'package:flutter/material.dart';
import 'package:projeto_bom_joia/app/my_app.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(MyApp.PEDIDOS_FORM);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: ListView(),
    );
  }
}
