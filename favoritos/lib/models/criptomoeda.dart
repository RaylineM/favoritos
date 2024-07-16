class Criptomoeda {
  final String id;
  final String symbol;
  final String name;
  final String imageUrl;
  final double currentPrice;
  bool isFavorited;

  Criptomoeda({
    required this.id,
    required this.symbol,
    required this.name,
    required this.imageUrl,
    required this.currentPrice,
    this.isFavorited = false,
  });

  factory Criptomoeda.fromJson(Map<String, dynamic> json) {
    return Criptomoeda(
      id: json['id'],
      symbol: json['symbol'],
      name: json['name'],
      imageUrl: json['image'],
      currentPrice: json['current_price'].toDouble(),
    );
  }
}
