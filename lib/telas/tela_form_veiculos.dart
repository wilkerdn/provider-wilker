import 'dart:convert';
import 'dart:math';
import '../models/veiculos.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TelaFormVeiculo extends StatefulWidget {
  @override
  _TelaFormVeiculoState createState() => _TelaFormVeiculoState();
}

class _TelaFormVeiculoState extends State<TelaFormVeiculo> {
  final form = GlobalKey<FormState>();
  final dadosForm = Map<String, Object>();

  void saveForm() {
    var formValido = form.currentState.validate();
    form.currentState.save();
    final novoVeiculo = Veiculos(
      id: Random().nextDouble().toString(),
      idmontadora: dadosForm['idmontadora'],
      nome: dadosForm['nome'],
      ano: dadosForm['ano'],
      combustivel: dadosForm['cumbustivel'],
      valor: dadosForm['valor'],
      imagem: dadosForm['imageUrl'],
    );

    if (formValido) {
      var url = Uri.https('pdm-montadora-default-rtdb.firebaseio.com',
          '/veiculos.json', {'q': '{http}'});
      http
          .post(
        url,
        body: json.encode(
          {
            'id': Random().nextDouble().toString(),
            'idmontadora': dadosForm['idmontadora'],
            'nome': dadosForm['nome'],
            'ano': dadosForm['ano'],
            'combustivel': dadosForm['cumbustivel'],
            'valor': dadosForm['valor'],
            'imagem': dadosForm['imageUrl'],
          },
        ),
      )
          .then((value) {
        print(value.body);
        Navigator.of(context).pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário veiculo'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              saveForm();
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: form,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome Veiculo'),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  dadosForm['nome'] = value;
                },
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return 'Informe um nome válido';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'ID Montadora'),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  dadosForm['idmontadora'] = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Ano'),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  dadosForm['ano'] = int.parse(value);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Combustível'),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  dadosForm['combustivel'] = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Valor'),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  dadosForm['valor'] = double.parse(value);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'URL da Imagem'),
                keyboardType: TextInputType.url,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) {
                  saveForm();
                },
                onSaved: (valor) => dadosForm['imageUrl'] = valor,
                validator: (valor) {
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
