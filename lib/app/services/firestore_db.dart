// import 'package:crud2/app/models/product_model.dart';
// import 'package:crud2/app/util/constant_util.dart';

// class FirestoreDB {
//   //initialize fire
//   final String collection = 'products';
//   //getAll
//   Stream<List<ProductModel>> getAllProducts() {
//     return firebaseFirestore.collection(collection).snapshots().map((query) =>
//         query.docs
//             .map((item) => ProductModel.fromSnapshot(item.data()))
//             .toList());
//   }
// }
