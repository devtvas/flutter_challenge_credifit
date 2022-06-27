import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud2/app/services/product_service.dart';
import 'package:crud2/app/util/custom_color.dart';
import 'package:flutter/material.dart';

import 'package:crud2/app/util/size_ext_util.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    var collection = FirebaseFirestore.instance.collection('types');
    // FirestoreService _storeServices = FirestoreService();
    return StreamBuilder<QuerySnapshot>(
      stream: collection.snapshots(),
      // stream: _storeServices.get(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else {
          return goToCategory(context);
        }
      },
    );
  }

  Widget goToCategory(
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () => press,
      // onTap: this.text != "Ver mais"
      //     ? () => Navigator.pushNamed(context, ProductFilterScreen.routeName,
      //         arguments: ProductFilterArguments(title: this.text))
      //     : (() => Navigator.pushNamed(
      //           context,
      //           AllCategoriesScreen.routeName,
      //         )),
      child: SizedBox(
        width: 20.0,
        child: Column(
          children: [
            Container(
              // padding: EdgeInsets.all(1.2),
              height: 27.0,
              width: 50.0,
              decoration: BoxDecoration(
                color: CustomColor.kSecondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: this.text != "Ver mais"
                  ? SvgPicture.asset("assets/icons/glasses.svg")
                  : SvgPicture.asset("assets/icons/Plus Icon.svg"),
            ),
            // SizedBox(height: 5.0),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 10.0),
            )
          ],
        ),
      ),
    );
  }
}
