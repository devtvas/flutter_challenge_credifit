import 'package:crud2/app/models/product_firestore_model.dart';
import 'package:crud2/app/util/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../util/custom_color.dart';

//details
class Body extends StatelessWidget {
  final ProductFirestoreModel? item;
  const Body({
    Key? key,
    this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //update
              Text(
                '${item!.title}',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.kBlackColor,
                ),
              ),
              //update
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: CustomColor.kBorderColor),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${item!.type}',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.kBlackColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            '${item!.description}',
            style: TextStyle(
              color: CustomColor.kSubtitleColor,
              fontSize: 13,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RatingBarIndicator(
                rating: Validators.convertIntRatingDouble(item!.rating),
                itemBuilder: (context, index) => const Icon(
                  Icons.star_rate_rounded,
                  color: Colors.indigo,
                ),
                itemCount: 5,
                itemSize: 20.0,
                direction: Axis.horizontal,
              ),
              //update
              Text(
                'R\$ ${Validators.formatCasaDecimal(item!.price)}',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.kBlackColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
