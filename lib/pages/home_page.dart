import 'package:flutter/material.dart';
import '../models/item.dart';
import 'item_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Item> items = [
    Item(name: "Sugar", price: 5000),
    Item(name: "Salt", price: 2000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shopping List")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          //  Langkah 7
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/item', arguments: Item);
              // Navigasi ke halaman detail
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemPage(item: items[index]),
                  
                ),
              );
            },
            child: Card(
              child: ListTile(
                title: Text(items[index].name),
                subtitle: Text(items[index].price.toString()),
              ),
            ),
          );
        },
      ),
    );
  }
}