import 'package:crud2/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductTile extends StatelessWidget {
  DocumentSnapshot prod;

  ProductTile(this.prod);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => ProductScreen(ad)));
      },
      child: Container(
        height: 135.0,
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
        child: Card(
          child: Row(
            children: <Widget>[
              SizedBox(
                height: 135.0,
                width: 127.0,
                child: Image.network(
                  'https://www.woolha.com/media/2020/03/eevee.png',
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        prod['title'],
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'R\$${prod['price']}',
                        style: TextStyle(
                            fontSize: 19.0, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        '${prod['rating']}, ${prod['price']}',
                        style: TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
