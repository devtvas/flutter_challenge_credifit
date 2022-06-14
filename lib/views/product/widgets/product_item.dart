import 'package:crud2/models/product_model.dart';
import 'package:crud2/util/alert_dialogs.dart';
import 'package:crud2/util/validators.dart';
import 'package:crud2/views/details/details_view.dart';
import 'package:crud2/views/edit/edit_view.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:flutter/services.dart';

class ProductItem extends StatelessWidget {
  DocumentSnapshot prod;

  ProductItem(this.prod);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => EditView(prod: prod),
            // builder: (context) => DetailsView(prod: prod),
          ),
        );
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
                      buildTop(context),
                      buildDown(context),
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

  Widget buildTop(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Text(
            prod['title'],
            style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis),
          ),
        ),
        IconButton(
          onPressed: () {
            AlertDialogTemplate().showDialogProductItem(context);
          },
          icon: Icon(Icons.more_horiz),
        )
        // Expanded(
        //   flex: 1,
        //   child: Text(
        //     prod['type'],
        //     style: const TextStyle(
        //         fontSize: 16.0,
        //         fontWeight: FontWeight.w400,
        //         overflow: TextOverflow.ellipsis),
        //   ),
        // ),
      ],
    );
  }

  Widget buildDown(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RatingBarIndicator(
          rating: Validators.convertIntRatingDouble(prod['rating']),
          itemBuilder: (context, index) => const Icon(
            Icons.star_rate_rounded,
            color: Colors.indigo,
          ),
          itemCount: 5,
          itemSize: 20.0,
          direction: Axis.horizontal,
        ),
        Text(
          // 'R\$ ${prod['price']}',
          'R\$ ${Validators.formatCasaDecimal(prod['price'])}',
          style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
