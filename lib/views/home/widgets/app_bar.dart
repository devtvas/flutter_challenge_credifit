import 'package:crud2/util/media_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppBarProd extends StatelessWidget {
  const AppBarProd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MQuery().init(context);
    return Container(
      constraints: BoxConstraints.expand(height: MQuery.height! * 0.25),
      // color: Colors.amber,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            // color: Colors.blue,
            child: const Text(
              "Credifit - Challenge",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
