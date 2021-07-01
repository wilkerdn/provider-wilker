import 'package:flutter/material.dart';
import '../models/veiculos.dart';

class ItemListaVeiculo extends StatelessWidget {
  final Veiculos veiculo;

  ItemListaVeiculo(this.veiculo);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: (Colors.lightGreen),
      title: Container(
        child: Text(
          veiculo.nome,
          style: TextStyle(color: Colors.white),
        ),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                print("Editar");
              },
              color: Colors.amber,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                print("Apagar");
              },
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
