import 'package:flutter/material.dart';

//importando meu modelo
import '../models/montadora.dart';

class ItemMontadora extends StatelessWidget {
  final Montadora montadora;

  const ItemMontadora(this.montadora);

  void _selecinarVeiculo(BuildContext context) {
    //vamos fazer um push de tela
    // Navigator.of(context).push(MaterialPageRoute(builder: (_) {
    //   return TelaVeiculos();
    // }));

    Navigator.of(context).pushNamed(
      '/veiculos',
      arguments: montadora,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selecinarVeiculo(context);
      },
      splashColor: Colors.orange,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(montadora.nome),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(colors: [
              Color(int.parse('0x${montadora.cor}')).withOpacity(0.5),
              Color(int.parse('0x${montadora.cor}')),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      ),
    );
  }
}
