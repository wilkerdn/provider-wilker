import '../componentes/drawer_personalisado.dart';
import '../componentes/veiculo_item_lista.dart';
import '../mockdata/veiculos_mock.dart';

import '../uteis/rotas.dart';
import 'package:flutter/material.dart';

class TelaCadastroVeiculo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final veiculos = VEICULOS_MOCK.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de veiculos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              print('Faz depois...');
              Navigator.of(context).pushNamed(Rotas.FORM_VEICULOS);
            },
          ),
        ],
      ),
      drawer: DrawerPersonalisado(),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: veiculos.length,
          itemBuilder: (ctx, i) => Column(
            children: [
              ItemListaVeiculo(veiculos[i]),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
