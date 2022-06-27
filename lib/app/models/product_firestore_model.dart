import 'package:cloud_firestore/cloud_firestore.dart';

class ProductFirestoreModel {
  String? title;
  String? type;
  String? description;
  String? filename;
  int? height;
  int? width;
  double? price;
  int? rating;
  String? dtEdicao;

  ProductFirestoreModel({
    this.title,
    this.type,
    this.description,
    this.filename,
    this.height,
    this.width,
    this.price,
    this.rating,
    this.dtEdicao,
  });

  factory ProductFirestoreModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return ProductFirestoreModel(
      title: data?['title'],
      type: data?['type'],
      description: data?['description'],
      filename: data?['filename'],
      height: data?['height'],
      width: data?['width'],
      price: data?['price'],
      rating: data?['rating'],
      dtEdicao: data?['dtEdicao'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (title != null) "title": title,
      if (type != null) "type": type,
      if (description != null) "description": description,
      if (filename != null) "filename": filename,
      if (height != null) "height": height,
      if (price != null) "price": price,
      if (rating != null) "rating": rating,
      if (dtEdicao != null) "dtEdicao": dtEdicao,
    };
  }
}
