import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './veiculos.dart';

class Montadora {
  final String id;
  final String nome;
  final String cor;
  final List<Veiculos> veiculos;

  const Montadora({
    @required this.id,
    @required this.nome,
    this.cor = "#ff00ff",
    this.veiculos,
  });
}
