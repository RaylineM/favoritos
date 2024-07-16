import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/criptomoeda_provider.dart';

class FavoritosListaTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Criptomoedas Favoritas',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 76, 66, 225),
      ),
      body: Consumer<CriptomoedaProvider>(
        builder: (context, criptoProvider, child) {
          final criptoFavoritas = criptoProvider.criptomoedasFavoritas;

          if (criptoFavoritas.isEmpty) {
            return Center(child: Text('Nenhuma criptomoeda favorita.'));
          }

          return ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: criptoFavoritas.length,
            itemBuilder: (context, index) {
              final cripto = criptoFavoritas[index];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.network(cripto.imageUrl, width: 50, height: 50),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cripto.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              cripto.symbol.toUpperCase(),
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            Text(
                              'R\$ ${cripto.currentPrice.toStringAsFixed(2)}',
                              style: TextStyle(color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.remove_circle,
                            color: Colors.red, size: 30),
                        onPressed: () {
                          criptoProvider.removerFavorito(cripto);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
