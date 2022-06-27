import 'package:crud2/app/models/product_firestore_model.dart';
import 'package:crud2/app/models/product_model.dart';
import 'package:crud2/app/models/product_model_old.dart';
import 'package:crud2/app/util/constant_util.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ProductService {
  final FirebaseFirestore firebaseFirestore;
  ProductService({required this.firebaseFirestore});
//  getAll
  // getAll() {
  //   Stream<List<ProductModel>> listProductModel = firebaseFirestore
  //       .collection(collection)
  //       .snapshots()
  //       .map((query) =>
  //           query.docs.map((item) => ProductModel.fromSnapshot(item)).toList());
  //   //
  //   return listProductModel;
  // }
  // getAll()  {
  //   try {
  //     var response = firebaseFirestore.collection(collection);
  //     if (response.path == 'products') {
  //       // Iterable jsonResponse = json.decode(response.body);
  //       List<ProductModel> listMyModel = response.doc().snapshots((map) {
  //         return ProductModel.fromSnapshot(map);
  //       }).toList();
  //       return listMyModel;
  //     } else
  //       print('erro -get');
  //   } catch (_) {}
  // }

  getAll() {
    return firebaseFirestore.collection(collection).snapshots();
  }
  // get() {
  //   return firebaseFirestore.collection(collection).where("rating", isEqualTo: 0).get().then(
  //         (res) => print("Successfully completed"),
  //         onError: (e) => print("Error completing: $e"),
  //       );
  // }
  // get() async {
  //   final docRef =
  //       firebaseFirestore.collection('products').withConverter<ProductFirestoreModel>(
  //             fromFirestore: ProductFirestoreModel.fromFirestore,
  //             toFirestore: (ProductFirestoreModel product, _) =>
  //                 product.toFirestore(),
  //           );
  //   final docSnap = await docRef.get();
  //   final product = docSnap.docs; // Convert to City object
  //   if (product != null) {
  //     print(product);
  //   } else {
  //     print("No such document.");
  //   }
  //   return docRef;
  // }

  Future set(
      dynamic id, String title, String type, double price, String data) async {
    // print(data);

    return await firebaseFirestore
        .collection('products')
        .doc(id)
        .set(
          {
            'title': title,
            'type': type,
            'price': price,
            'data': data,
          },
        )
        .then((value) => print('dados alterados com sucesso!'))
        .catchError((err) {
          print('Error: $err'); // Prints 401.
        }, test: (error) {
          return error is int && error >= 400;
        });
  }

  Future put(dynamic id, String title, String type, double price) async {
    return await firebaseFirestore
        .collection('products')
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

  Future delete(dynamic id) async {
    return await firebaseFirestore
        .collection('products')
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
