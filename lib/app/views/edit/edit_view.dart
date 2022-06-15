import 'package:crud2/app/util/custom_color.dart';
import 'package:crud2/app/views/edit/components/body.dart';
import 'package:crud2/app/views/edit/components/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class EditView extends StatefulWidget {
  final DocumentSnapshot? prod;

  const EditView({Key? key, required this.prod}) : super(key: key);

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
              Header(item: widget.prod),
              Body(item: widget.prod),
            ],
          ),
        ),
      ),
    );
  }
}
