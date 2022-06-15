import 'package:crud2/util/custom_color.dart';
import 'package:crud2/util/media_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ListVertical extends StatelessWidget {
  const ListVertical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> types = [
      "Fruit",
      "dairy",
      "vegetable",
      "bakery",
    ];
    return Container(
      constraints: BoxConstraints.expand(height: MQuery.height! * 0.2),
      // color: Colors.blue,
      child: Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: types.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    // padding: const EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 15.0),
                    width: 150.0,
                    height: 50,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: CustomColor.credifit,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black87.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 1,
                          offset:
                              const Offset(0, 4), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        types[index],
                        style: TextStyle(
                            color: CustomColor.tTitleWhite,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
