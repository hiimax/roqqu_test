class Symbols {
  Symbols({
    required this.symbol,
    required this.price,
  });

  factory Symbols.fromJson(Map<String, dynamic> json) {
    return Symbols(
      symbol: json['symbol'],
      price: json['price'],
    );
  }

  factory Symbols.empty() => Symbols(
        price: '',
        symbol: '',
      );
  final String symbol;
  final String price;
}
