import 'telas/tela_form_montadora.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'telas/tela_cadastro_montadora.dart';
import 'telas/tela_cadastro_veiculos.dart';
import 'telas/tela_form_veiculos.dart';
import 'telas/tela_veiculos.dart';
import 'telas/tela_detalhes_veiculos.dart';
import 'telas/tela_guias.dart';
import 'telas/tela_parametros.dart';
import 'uteis/rotas.dart';
import 'providers/montadora.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => MontadorasProvider(),
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green),
        routes: {
          Rotas.HOME: (ctx) => TelaTabulacao(),
          Rotas.VEICULOS: (ctx) => TelaVeiculos(),
          Rotas.DETALHES_VEICULOS: (ctx) => TelaDetalhes(),
          Rotas.PARAMETROS: (ctx) => TelaParametros(),
          Rotas.CADASTRO_MONTADORAS: (ctx) => TelaCadastroMontadora(),
          Rotas.FORM_MONTADORAS: (ctx) => TelaFormMontadora(),
          Rotas.CADASTRO_VEICULOS: (ctx) => TelaCadastroVeiculo(),
          Rotas.FORM_VEICULOS: (ctx) => TelaFormVeiculo(),
        },
        onGenerateRoute: (settings) {
          print(settings.name);
          return null;
        },
        onUnknownRoute: (settings) {
          print("rota nao encontrada");
          return null;
        },
      ),
    );
  }
}
