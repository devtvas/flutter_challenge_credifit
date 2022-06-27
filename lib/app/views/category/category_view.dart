import 'package:crud2/app/views/category/components/category_card.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/Flash Icon.svg", "text": "Destaques"},
      {"icon": "assets/icons/Bill Icon.svg", "text": "Outros"},
      {"icon": "assets/icons/Game Icon.svg", "text": "Promoções"},
      {"icon": "assets/icons/Gift Icon.svg", "text": "Retangular"},
      {"icon": "assets/icons/Gift Icon.svg", "text": "Retangular"},
      {"icon": "assets/icons/Discover.svg", "text": "Ver mais"},
    ];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {
              print('tap');
            },
          ),
        ),
      ),
    );
  }
//   // Get the proportionate height as per screen size
// double getProportionateScreenWidth(double inputWidth) {
//   double screenWidth = SizeConfig.screenWidth;
//   // 375 is the layout width that designer use
//   return (inputWidth / 375.0) * screenWidth;
// }
}
