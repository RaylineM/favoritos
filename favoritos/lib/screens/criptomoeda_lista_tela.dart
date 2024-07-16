import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/criptomoeda_provider.dart';

class CriptomoedaListaTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista de Criptomoedas',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 76, 66, 225),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.pushNamed(context, '/favoritos');
            },
          ),
        ],
      ),
      body: Consumer<CriptomoedaProvider>(
        builder: (context, criptoProvider, child) {
          if (criptoProvider.criptomoedas.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: criptoProvider.criptomoedas.length,
            itemBuilder: (context, index) {
              final cripto = criptoProvider.criptomoedas[index];
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
                        icon: Icon(
                          cripto.isFavorited ? Icons.star : Icons.star_border,
                          color: cripto.isFavorited ? Colors.yellow : null,
                          size: 30,
                        ),
                        onPressed: () {
                          criptoProvider.alternarStatusFavorito(cripto);
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
