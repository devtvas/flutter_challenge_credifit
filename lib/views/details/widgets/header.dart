import 'package:crud2/util/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//details
class Header extends StatelessWidget {
  final DocumentSnapshot? item;
  const Header({
    Key? key,
    this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.1,
      child: ClipPath(
        clipper: MyClipper(),
        child: Container(
          padding:
              const EdgeInsets.only(left: 10, right: 15, top: 20, bottom: 20),
          decoration: BoxDecoration(
            color: CustomColor.kSecondaryColor,
          ),
          child: LayoutBuilder(
            builder: (_, constraints) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: Icon(Icons.chevron_left,
                            color: CustomColor.kBlackColor, size: 30),
                      ),
                      // SvgPicture.asset('assets/icons/share.svg'),
                    ],
                  ),
                  Hero(
                    tag: item.hashCode,
                    child: Image.asset(
                      'assets/images/egg_red.png',
                      width: constraints.maxWidth * 0.6,
                      height: constraints.maxHeight * 0.6,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 60);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
