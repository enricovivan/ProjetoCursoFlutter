import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_bom_joia/app/database/firestore/pratos_dao_firestore.dart';
import 'package:projeto_bom_joia/app/database/sqlite/dao/pratos_dao_impl.dart';
import 'package:projeto_bom_joia/app/domain/interfaces/pratos_dao.dart';
import 'package:projeto_bom_joia/app/domain/services/prato_service.dart';

configuraInjecao() async {
  GetIt getIt = GetIt.instance;

  //definindo na injeção de dependencia que quando necessitar das operações do banco de dados (interface DAO),
  //é pra injeção de dependencia crair e injetar um objeto na implementação do DAO.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //registerSingleton cria um unico objeto pra atender todo mundo // compartilha as informações do objeto
  //registerFactory cria um objeto para cada requisição
  getIt.registerSingleton<PratosDAO>(PratosDAOImpl());
  getIt.registerSingleton<PratoService>(PratoService());
}
