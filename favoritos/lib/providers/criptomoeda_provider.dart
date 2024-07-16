import 'dart:convert';
import 'package:favoritos/models/criptomoeda.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CriptomoedaProvider with ChangeNotifier {
  List<Criptomoeda> _criptomoedas = [];

  List<Criptomoeda> get criptomoedas => _criptomoedas;
  List<Criptomoeda> get criptomoedasFavoritas =>
      _criptomoedas.where((cripto) => cripto.isFavorited).toList();

  void alternarStatusFavorito(Criptomoeda cripto) {
    cripto.isFavorited = !cripto.isFavorited;
    notifyListeners();
  }

  void removerFavorito(Criptomoeda cripto) {
    cripto.isFavorited = false;
    notifyListeners();
  }

  Future<void> buscarCriptomoedas() async {
    final url = 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=brl';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _criptomoedas = data.map((json) => Criptomoeda.fromJson(json)).toList();
        notifyListeners();
      } else {
        throw Exception('Falha no carregamento das criptomoedas');
      }
    } catch (error) {
     
    }
  }
}
