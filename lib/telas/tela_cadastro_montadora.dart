import '../componentes/drawer_personalisado.dart';
import '../componentes/montadora_item_lista.dart';
import '../mockdata/montadora_mock.dart';

import '../uteis/rotas.dart';
import 'package:flutter/material.dart';

class TelaCadastroMontadora extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final montadoras = MONTADORAS_MOCK.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de montadoras'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(Rotas.FORM_MONTADORAS);
            },
          ),
        ],
      ),
      drawer: DrawerPersonalisado(),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: montadoras.length,
          itemBuilder: (ctx, i) => Column(
            children: [
              ItemListaMontadora(montadoras[i]),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
