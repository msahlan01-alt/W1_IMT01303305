class MenuItem {
  final String name;
  final int price;
  final double? discountPercent;

  const MenuItem({
    required this.name,
    required this.price,
    this.discountPercent,
  });

  int finalPrice() => (price - (price * (discountPercent ?? 0) / 100)).round();

  @override
  String toString() => name;
}

const items = [
  MenuItem(name: 'Indomie Telur', price: 12000),
  MenuItem(name: 'Es Kopi Susu', price: 8000, discountPercent: 15),
  MenuItem(name: 'Nasi Ayam Geprek', price: 18000, discountPercent: 10),
  MenuItem(name: 'Teh Kotak', price: 5000),
];

void main() {
  final names = items.map((e) => e.name).toList();
  final cheapItems = items.where((e) => e.price < 15000).toList();
  final total = items.fold<int>(0, (sum, e) => sum + e.finalPrice());

  print(names);
  print(cheapItems);
  print(total);
}