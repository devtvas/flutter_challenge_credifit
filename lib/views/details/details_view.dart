import 'package:crud2/util/custom_color.dart';
import 'package:crud2/views/details/widgets/body.dart';
import 'package:crud2/views/details/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class DetailsView extends StatelessWidget {
  static const routeName = 'item-details-screen/';
  final DocumentSnapshot? prod;

  const DetailsView({Key? key, required this.prod}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Header(item: prod),
              Body(item: prod),
              SizedBox(height: 15),
              Divider(color: CustomColor.kBorderColor),
            ],
          ),
        ),
      ),
    );
  }
}
