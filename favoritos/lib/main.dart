import 'package:favoritos/providers/criptomoeda_provider.dart';
import 'package:favoritos/screens/criptomoeda_lista_tela.dart';
import 'package:favoritos/screens/favoritos_lista_tela.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CriptomoedaProvider()..buscarCriptomoedas(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Criptomoedas',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 18, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.grey[700]),
        ),
      ),
      home: CriptomoedaListaTela(),
      routes: {
        '/favoritos': (context) => FavoritosListaTela(),
      },
    );
  }
}
