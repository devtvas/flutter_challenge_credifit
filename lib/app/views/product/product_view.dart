// import 'package:crud2/app/controllers/product_controller.dart';
// import 'package:crud2/app/models/product_firestore_model.dart';
// import 'package:crud2/app/models/product_model.dart';
// import 'package:crud2/app/models/product_model_old.dart';
// import 'package:crud2/app/services/firestore_service.dart';
// import 'package:crud2/app/util/media_query.dart';
// import 'package:crud2/app/views/product/components/product_card.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:grouped_list/grouped_list.dart';

// class ProductView extends StatelessWidget {
//   ProductView({Key? key}) : super(key: key);

//   final productController = Get.put(ProductController());

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => ListView.builder(
//           itemCount: productController.products.length,
//           itemBuilder: (context, index) {
//             final product = productController.products;
//             // return ProductCard(index: index);
//             return Text('${product[index].title}');
//           }),
//     );
//   }
// }
