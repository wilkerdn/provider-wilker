import 'package:flutter/material.dart';
import '../mockdata/montadora_mock.dart';
import '../models/montadora.dart';

//SEGUE O PADRÃO OBSERVER - A IDEIA É INFORMAR A TODOS INTERESSADOS QUE ACONTECEU ALGUMA MUDANÇA
class MontadorasProvider with ChangeNotifier {
  List<Montadora> _montadoras = MONTADORAS_MOCK.toList();

  //Não quero passar o controle da lista para o get
  //portanto uso o operador ... para "separar os itens" em um novo vetor
  List<Montadora> get getMontadoras => [..._montadoras];

  void adicionarMontadora(Montadora montadora) {
    _montadoras.add(montadora);
    //nesse momento temos efetivamente uma mudança em nossos dados
    //estamos adicionando um valor a montadora portanto vamo informar ao padrão
    //que estamos realizando tal mudança
    notifyListeners();
  }
}
