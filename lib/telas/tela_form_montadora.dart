import 'dart:math';
import '../providers/montadora.dart';
import 'package:provider/provider.dart';

import '../models/montadora.dart';
import 'package:flutter/material.dart';

class TelaFormMontadora extends StatefulWidget {
  @override
  _TelaFormMontadoraState createState() => _TelaFormMontadoraState();
}

class _TelaFormMontadoraState extends State<TelaFormMontadora> {
  final form = GlobalKey<FormState>();
  final dadosForm = Map<String, Object>();
  void saveForm() {
    var formValido = form.currentState.validate();
    form.currentState.save();
    final novaMontadora = Montadora(
      id: Random().nextDouble().toString(),
      nome: dadosForm['nome'],
    );
    print(novaMontadora.id);
    print(novaMontadora.nome);

    if (formValido) {
      /*   var url = Uri.https('pdm-montadora-default-rtdb.firebaseio.com',
          '/montadoras.json', {'q': '{http}'});
      http
          .post(
        url,
        body: json.encode(
          {
            'id': novaMontadora.id,
            'nome': novaMontadora.nome,
          },
        ),
      )
          .then((value) {
        print('Faz depois');
        print(value.body);
        Navigator.of(context).pop();
      }); */
      Provider.of<MontadorasProvider>(context, listen: true)
          .adicionarMontadora(novaMontadora);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário montadora'),
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
                decoration: InputDecoration(labelText: 'Nome montadora'),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  dadosForm['nome'] = value;
                },
                validator: (value) {
                  if (value.trim().isEmpty) {
                    print('erro');
                    return 'Informe um nome válido';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Cor'),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  dadosForm['cor'] = value;
                },
                onFieldSubmitted: (_) {
                  saveForm();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
