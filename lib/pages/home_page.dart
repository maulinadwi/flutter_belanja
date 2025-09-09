import 'package:flutter/material.dart';
import '../models/item.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Item> items = [
    Item(name: "salt", price: 70000, photo: "assets/beras.jpeg", stock: 10, rating: 4.7),
    Item(name: "sugar", price: 17000, photo: "assets/gula.jpeg", stock: 20, rating: 4.7),
    Item(name: "cooking oil", price: 18000, photo: "assets/minyak.jpeg", stock: 15, rating: 4.6),
    Item(name: "egg", price: 30000, photo: "assets/telur.jpeg", stock: 25, rating: 4.8),
   
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ShopingList")),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ItemCard(item: item);
        },
      ),
      bottomNavigationBar: const BottomAppBar(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Nama: [maulina dwi] - Nim: [362458302140]',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Item item;

  const ItemCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/item', arguments: item);
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Hero(
                tag: 'itemPhoto${item.name}',
                child: Image.network(
                  item.photo,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                item.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("Rp ${item.price}"),

            ),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("stock ${item.stock}"),
             ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 8.0),
              child: Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 20),
                  const SizedBox(width: 4),
                  Text(item.rating.toString()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
