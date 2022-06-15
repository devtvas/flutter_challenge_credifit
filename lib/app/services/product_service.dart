import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ProductService {
  var collection = FirebaseFirestore.instance.collection('products');

  updateProduct(dynamic id, String title, String type, double price) {
    collection
        .doc(id)
        .update(
          {
            'title': title,
            'type': type,
            'price': price,
          },
        )
        .then((value) => print('dados alterados com sucesso!'))
        .catchError((err) {
          print('Error: $err'); // Prints 401.
        }, test: (error) {
          return error is int && error >= 400;
        });
  }

  removeProduct(dynamic id) {
    collection
        .doc(id)
        .delete()
        .then((value) => print('dados excluidos com sucesso!'))
        .catchError((err) {
      print('Error: $err'); // Prints 401.
    }, test: (error) {
      return error is int && error >= 400;
    });
  }
}
