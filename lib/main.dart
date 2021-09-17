import 'package:flutter/material.dart';

import 'app/my_app.dart';

void main() async {
  await loadInit();
  await loadInterface();
  await loadButtons();
  print('Executando...');
  runApp(const MyApp());
}

// funções assíncronas
Future loadInit() =>
    Future.delayed(Duration(seconds: 2), () => print('Inicializando o APP...'));

Future loadInterface() {
  return Future.delayed(
      Duration(seconds: 2), () => print('Carregando Interface...'));
}

Future loadButtons() {
  return Future.delayed(Duration(seconds: 2), () => print('Carregando botões'));
}
