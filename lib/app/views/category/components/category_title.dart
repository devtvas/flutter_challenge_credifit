import 'package:crud2/app/util/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoryTitle extends StatelessWidget {
  final String? title;
  const CategoryTitle({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title!,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: CustomColor.kBlackColor,
            ),
          ),
          // InkWell(
          //   onTap: () {},
          //   child: Text(
          //     'See all',
          //     style: TextStyle(color: CustomColor.kPrimaryColor),
          //   ),
          // ),
        ],
      ),
    );
  }
}
