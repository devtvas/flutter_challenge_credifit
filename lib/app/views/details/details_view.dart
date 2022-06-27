import 'package:crud2/app/models/product_firestore_model.dart';
import 'package:crud2/app/util/custom_color.dart';
import 'package:crud2/app/views/details/components/body.dart';
import 'package:crud2/app/views/details/components/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class DetailsView extends StatefulWidget {
  static const routeName = 'item-details-screen/';
  final ProductFirestoreModel? prod;

  const DetailsView({Key? key, required this.prod, ProductFirestoreModel? item})
      : super(key: key);

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Header(item: widget.prod),
              Body(item: widget.prod),
              SizedBox(height: 15),
              Divider(color: CustomColor.kBorderColor),
            ],
          ),
        ),
      ),
    );
  }
}
