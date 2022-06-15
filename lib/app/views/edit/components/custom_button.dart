import 'package:crud2/app/util/custom_color.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;
  const CustomButton({
    Key? key,
    this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: CustomColor.tEditProd,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title!,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: CustomColor.tTitleWhite,
          ),
        ),
      ),
    );
  }
}
