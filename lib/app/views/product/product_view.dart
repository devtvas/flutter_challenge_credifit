import 'package:crud2/app/util/media_query.dart';
import 'package:crud2/app/views/product/components/product_item.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grouped_list/grouped_list.dart';

class ProductView extends StatefulWidget {
  const ProductView({Key? key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    var collection = FirebaseFirestore.instance.collection('products');
    return Container(
      constraints: BoxConstraints.tightForFinite(height: MQuery.height! * 1.2),
      // color: Colors.white60,
      child: Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          StreamBuilder<QuerySnapshot>(
            stream: collection.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("Something ${snapshot.error}");
              } else if (snapshot.hasData) {
                // return ProductList(snapshot);
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot product = snapshot.data!.docs[index];
                      // snapshot.data!.docs[index];
                      // return Text(doc['title']);
                      // return buildItem(product);
                      return ProductItem(product);
                      // return ProductList(product);
                    });
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
