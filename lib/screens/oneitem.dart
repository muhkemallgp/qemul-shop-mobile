import 'package:flutter/material.dart';
import 'package:qemulshop_app/model/item_api.dart';

class ItemDetailPage extends StatelessWidget {
  final Item item;

  const ItemDetailPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.fields.name),
        backgroundColor: const Color.fromARGB(255, 163, 0, 239),
        foregroundColor: const Color.fromARGB(255, 2, 1, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${item.fields.name}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Amount: ${item.fields.amount}'),
            SizedBox(height: 10),
            Text('Description: ${item.fields.description}'),
          ],
        ),
      ),
    );
  }
}
