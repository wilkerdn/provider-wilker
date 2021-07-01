import 'dart:convert';
import 'package:aula3_veiculos/mockdata/montadora_mock.dart';
import 'package:flutter/material.dart';
import '../models/montadora.dart';
import 'package:http/http.dart' as http;
import '../uteis/variaveis.dart';

//SEGUE O PADRÃO OBSERVER - A IDEIA É INFORMAR A TODOS INTERESSADOS QUE ACONTECEU ALGUMA MUDANÇA
class MontadorasProvider with ChangeNotifier {
  List<Montadora> _montadoras = MONTADORAS_MOCK.toList();
  List<Montadora> _itens = [];

//Não quero passar o controle da lista para o get
  //portanto uso o operador ... para "separar os itens" em um novo vetor
  List<Montadora> get getMontadoras => [..._montadoras];

  Future<void> adicionarMontadora(Montadora montadora) async {
    //_montadoras.add(montadora);
    var url = Uri.https(Variaveis.BACKURL, '/montadoras.json');
    final resposta = await http.post(
      url,
      body: json.encode({
        'nome': montadora.nome,
        'cor': montadora.cor,
      }),
    );
    _itens.add(
      Montadora(
        id: json.decode(resposta.body)['name'],
        nome: montadora.nome,
        cor: montadora.cor,
      ),
    );
    notifyListeners();
    //nesse momento temos efetivamente uma mudança em nossos dados
    //estamos adicionando um valor a montadora portanto vamo informar ao padrão
    //que estamos realizando tal mudança
  }

  //PARA FAZER REQUISIÇÕSE SINCRONAS DEVEMOS RETORNAR O FUTURE
  Future<void> buscaMontadoras() async {
    var url = Uri.https(Variaveis.BACKURL, '/montadoras.json');
    var resposta = await http.get(url);
    Map<String, dynamic> data = json.decode(resposta.body);
    _montadoras.clear();
    data.forEach((idMontadora, dadosMontadora) {
      adicionarMontadora(Montadora(
        id: idMontadora,
        nome: dadosMontadora['nome'],
        cor: dadosMontadora['cor'],
      ));
    });
    notifyListeners();
  }
}
