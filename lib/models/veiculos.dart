import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Veiculos {
  final String id;
  final String idmontadora;
  final String nome;
  final int ano;
  final String combustivel;
  final double valor;
  final String imagem; //caminho da imagem na web

  const Veiculos(
      {@required this.id,
      @required this.idmontadora,
      @required this.nome,
      @required this.ano,
      @required this.combustivel,
      @required this.valor,
      @required this.imagem});
}
