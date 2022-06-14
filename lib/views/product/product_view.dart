import 'package:crud2/models/product_model.dart';
import 'package:crud2/util/media_query.dart';
import 'package:crud2/views/product/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grouped_list/grouped_list.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      constraints: BoxConstraints.tightForFinite(height: MQuery.height! * 1.2),
      // color: Colors.white60,
      child: Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection('products').snapshots(),
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
