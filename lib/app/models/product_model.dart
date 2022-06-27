import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String? title;
  String? type;
  String? description;
  String? filename;
  int? height;
  int? width;
  double? price;
  int? rating;
  // String? dtUpdate;

  ProductModel({
    this.title,
    this.type,
    this.description,
    this.filename,
    this.height,
    this.width,
    this.price,
    this.rating,
    // this.dtUpdate,
  });

  static ProductModel fromSnapshot(DocumentSnapshot snap) {
    ProductModel productModel = ProductModel(
      title: snap['title'],
      type: snap['type'],
      description: snap['description'],
      filename: snap['filename'],
      height: snap['height'],
      width: snap['width'],
      price: snap['price'],
      rating: snap['rating'],
      // dtUpdate: snap['dtUpdate'],
    );
    return productModel;
  }

  // ProductModel.fromSnapshot(Map<String, dynamic> data) {
  //   title = data['title'];
  //   type = data['type'];
  //   description = data['description'];
  //   filename = data['filename'];
  //   height = data['height'];
  //   width = data['width'];
  //   price = data['price'];
  //   rating = data['rating'];
  // }
}
