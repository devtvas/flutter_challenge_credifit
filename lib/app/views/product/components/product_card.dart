// import 'package:crud2/app/controllers/product_controller.dart';
// import 'package:crud2/app/util/custom_color.dart';
// import 'package:crud2/app/util/validators.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// import 'package:get/get.dart';

// //https://betterprogramming.pub/popup-menu-customization-in-flutter-aa8827f6ce39
// class ProductCard extends StatelessWidget {
//   // final productController = Get.put(ProductController());
//   ProductController productController = Get.find();
//   final int index;
//   ProductCard({Key? key, required this.index}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // Navigator.of(context).push(
//         //   MaterialPageRoute(
//         //     builder: (context) => DetailsView(
//         //       item: index,
//         //       prod: null,
//         //     ),
//         //   ),
//         // );
//       },
//       child: Container(
//         height: 135.0,
//         margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
//         child: Card(
//           child: Row(
//             children: <Widget>[
//               //*TODO verificar como sera feita o tratamento dessa imagem
//               SizedBox(
//                 height: 130.0,
//                 width: 120.0,
//                 // child: Placeholder(),
//                 // child: Image.network(
//                 //   'https://www.woolha.com/media/2020/03/eevee.png',
//                 //   fit: BoxFit.cover,
//                 // ),
//                 child: Center(
//                     child:
//                         Text("${productController.products[index].filename}")),
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       buildTop(context),
//                       buildDown(context),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildTop(BuildContext context) {
//     return Row(
//       children: <Widget>[
//         Expanded(
//           flex: 4,
//           child: Text(
//             "${productController.products[index].title}",
//             style: const TextStyle(
//                 fontSize: 16.0,
//                 fontWeight: FontWeight.w400,
//                 overflow: TextOverflow.ellipsis),
//           ),
//         ),
//         PopupMenuButton(
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(
//               Radius.circular(20.0),
//             ),
//           ),
//           child: Container(
//             child: const Icon(
//               Icons.more_horiz,
//               size: 30.0,
//             ),
//             decoration: BoxDecoration(
//                 color: CustomColor.kSecondaryColor, shape: BoxShape.circle),
//           ),
//           itemBuilder: (ctx) => [
//             _buildPopupMenuItem('Edit', Icons.edit, 0),
//             _buildPopupMenuItem('Delete', Icons.delete, 1),
//           ],
//           onSelected: (value) {
//             // _onMenuItemSelected(value as int);
//           },
//         )
//       ],
//     );
//   }

//   PopupMenuItem _buildPopupMenuItem(
//       String title, IconData iconData, int value) {
//     return PopupMenuItem(
//       value: value,
//       child: Row(
//         children: [
//           Icon(
//             iconData,
//             color: Colors.black,
//           ),
//           Text(title),
//         ],
//       ),
//     );
//   }

//   // _onMenuItemSelected(int value) {
//   //   setState(() {
//   //     _popupMenuItemIndex = value;
//   //   });

//   //   if (value == 0) {
//   //     Navigator.of(context).push(
//   //       MaterialPageRoute(
//   //         builder: (context) => EditView(item: index),
//   //       ),
//   //     );
//   //   } else {
//   //     // TemplateDialog().showDialogRemoveItem(context, widget.item!.id);
//   //   }
//   // }

//   Widget buildDown(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         RatingBarIndicator(
//           rating: Validators.convertIntRatingDouble(
//               productController.products[index].rating),
//           itemBuilder: (context, index) => const Icon(
//             Icons.star_rate_rounded,
//             color: Colors.indigo,
//           ),
//           itemCount: 5,
//           itemSize: 20.0,
//           direction: Axis.horizontal,
//         ),
//         Text(
//           // 'R\$ ${item['price']}',
//           'R\$ ${Validators.formatCasaDecimal(productController.products[index].price)}',
//           style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w700),
//         ),
//       ],
//     );
//   }
// }
