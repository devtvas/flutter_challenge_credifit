import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCard extends StatelessWidget {
  DocumentSnapshot item;

  ProductCard(this.item);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'name: ${item['filename']}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'todo: ${item['price']}',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Age: ${item['price']}',
              style: TextStyle(fontSize: 10),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
