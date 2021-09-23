import 'package:flutter/material.dart';
import 'package:projeto_bom_joia/app/view/cronometro_general.dart';
import 'package:projeto_bom_joia/app/view/homepage.dart';
import 'package:projeto_bom_joia/app/view/pedidos_form.dart';

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);
  static const HOME = '/';
  static const PEDIDOS_FORM = 'pedidos_form';
  static const CRONOMETRO_GENERAL = 'cronometro_general';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pedidos & Tempo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      routes: {
        HOME: (context) => HomePage(),
        PEDIDOS_FORM: (context) => PedidosForm(),
        CRONOMETRO_GENERAL: (context) => CronometroGeneral(),
      },
    );
  }
}
