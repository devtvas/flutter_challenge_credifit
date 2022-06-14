import 'package:crud2/util/custom_color.dart';
import 'package:crud2/util/media_query.dart';
import 'package:crud2/util/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

//edit
class Body extends StatelessWidget {
  final DocumentSnapshot? item;
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
              Container(
                width: MQuery.width! * 0.5,
                height: MQuery.height! * 0.05,
                alignment: Alignment.center,
                child: ListView(
                  children: [
                    TextFormField(
                      // controller: controllerSubtitle,
                      minLines: 4,
                      maxLines: 25,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: CustomColor.tEditProd.withOpacity(0.2),
                        hintText: '${item!['title']} *',
                        hintStyle: TextStyle(
                          color: CustomColor.tTitleWhite,
                        ),
                        // labelText: "Descrição Mensagem"
                      ),
                    )
                  ],
                ),
              ),

              //update
              Container(
                width: MQuery.width! * 0.35,
                height: MQuery.height! * 0.05,
                alignment: Alignment.center,
                child: ListView(
                  children: [
                    TextFormField(
                      // controller: controllerSubtitle,
                      minLines: 4,
                      maxLines: 25,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: CustomColor.tEditProd.withOpacity(0.2),
                        hintText: '${item!['type']} *',
                        hintStyle: TextStyle(
                          color: CustomColor.tTitleWhite,
                        ),
                        // labelText: "Descrição Mensagem"
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            item!['description'],
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
                rating: Validators.convertIntRatingDouble(item!['rating']),
                itemBuilder: (context, index) => const Icon(
                  Icons.star_rate_rounded,
                  color: Colors.indigo,
                ),
                itemCount: 5,
                itemSize: 20.0,
                direction: Axis.horizontal,
              ),
              Container(
                width: MQuery.width! * 0.35,
                height: MQuery.height! * 0.05,
                alignment: Alignment.center,
                child: ListView(
                  children: [
                    TextFormField(
                      // controller: controllerSubtitle,
                      keyboardType: TextInputType.number,
                      minLines: 4,
                      maxLines: 25,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: CustomColor.tEditProd.withOpacity(0.2),
                        // icon: Icon(Icons.description, size: 30, color: Colors.grey),
                        hintText:
                            'R\$ ${Validators.formatCasaDecimal(item!['price'])} *',
                        hintStyle: TextStyle(
                          color: CustomColor.tTitleWhite,
                        ),

                        // labelText: "Descrição Mensagem"
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
