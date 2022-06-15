import 'package:crud2/models/product_model.dart';
import 'package:crud2/util/custom_color.dart';
import 'package:crud2/util/media_query.dart';
import 'package:crud2/views/home/widgets/app_bar.dart';
import 'package:crud2/views/product/widgets/product_item.dart';
import 'package:crud2/views/home/widgets/list_vertical.dart';
import 'package:crud2/views/product/product_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grouped_list/grouped_list.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _ProductViewState();
}

class _ProductViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: CustomColor.gray200,
          // constraints:
          //     BoxConstraints.tightForFinite(height: MQuery.height! * 100),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                //1
                AppBarProd(),
                //2
                ListVertical(),
                //3
                SizedBox(height: 10),
                // const CategoryTitle('All Products'),
                // SizedBox(height: 10),
                ProductView(),
                //
              ],
            ),
          ),
        ),
      ),
    );
  }
}
