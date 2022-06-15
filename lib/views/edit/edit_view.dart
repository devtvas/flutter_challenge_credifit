import 'package:crud2/util/custom_color.dart';
import 'package:crud2/views/edit/widgets/body.dart';
import 'package:crud2/views/edit/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class EditView extends StatelessWidget {
  final DocumentSnapshot? prod;

  const EditView({Key? key, required this.prod}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Header(item: prod),
              Body(item: prod),
            ],
          ),
        ),
      ),
    );
  }
}
