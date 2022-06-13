import 'package:crud2/models/product_model.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';

class ProductTile extends StatelessWidget {
  DocumentSnapshot prod;

  ProductTile(this.prod);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => ProductScreen(ad)));
        print('object');
      },
      child: Container(
        height: 135.0,
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
        child: Card(
          child: Row(
            children: <Widget>[
              //*TODO verificar como sera feita o tratamento dessa imagem
              SizedBox(
                height: 130.0,
                width: 120.0,
                // child: Placeholder(),
                // child: Image.network(
                //   'https://www.woolha.com/media/2020/03/eevee.png',
                //   fit: BoxFit.cover,
                // ),
                child: Center(child: Text(prod['filename'])),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      buildTop(),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      buildDown(),
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

  Widget buildTop() {
    return Row(
      children: [
        Expanded(
          child: Text(
            prod['title'],
            style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_horiz),
        )
      ],
    );
  }

  Widget buildDown() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RatingBarIndicator(
          rating: convertIntRatingDouble(prod['rating']),
          itemBuilder: (context, index) => const Icon(
            Icons.star,
            color: Colors.indigo,
          ),
          itemCount: 5,
          itemSize: 20.0,
          direction: Axis.horizontal,
        ),
        Text(
          // 'R\$ ${prod['price']}',
          'R\$ ${formatCasaDecimal(prod['price'])}',
          style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }

  //*Todo camada de negocio
  convertIntRatingDouble(dynamic rating) {
    //converter rating int x double
    final int x = rating;
    final double ratingConvertido = x.toDouble();
    return ratingConvertido;
  }

  formatCasaDecimal(dynamic price) {
    //formatar as casas decimais Ex.: De(28.1) Para(28,10)
    var formatter = new NumberFormat("###,###.00#", "pt_BR");
    dynamic priceModified = formatter.format(price);
    print(priceModified);
    return priceModified;
  }
}
