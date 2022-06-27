import 'package:crud2/app/models/product_firestore_model.dart';
import 'package:crud2/app/util/custom_color.dart';
import 'package:crud2/app/views/edit/components/body.dart';
import 'package:crud2/app/views/edit/components/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class EditView extends StatefulWidget {
  final ProductFirestoreModel? item;

  const EditView({Key? key, this.item}) : super(key: key);

  @override
  State<EditView> createState() => _EditViewState();
}

class _EditViewState extends State<EditView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Header(item: widget.item),
              Body(item: widget.item),
            ],
          ),
        ),
      ),
    );
  }
}
