import 'package:flutter/material.dart';

class CronometroGeneral extends StatefulWidget {
  //const CronometroGeneral({Key? key}) : super(key: key);

  @override
  _CronometroGeneralState createState() => _CronometroGeneralState();
}

class _CronometroGeneralState extends State<CronometroGeneral> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tempo Restante'),
      ),
      body: ListView(),
    );
  }
}
