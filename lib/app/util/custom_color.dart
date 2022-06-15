import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomColor {
  static const purple700 = Color(0xFF292537);
  static const pink700 = Color(0xffE4105D);
  static const blue750 = Color(0xff249FEF);
  static const purple750 = Color(0xff5F53D5);
  static const gray700 = Color(0xff1E192C);
  static const gray200 = Color(0xffe0e0e0);

  static const blue200 = Color(0xffECEFF7);
  static const credifit = Color(0xff048988);

  static Color kPrimaryColor = HexColor('#53B175');
  static Color kShadowColor = HexColor('#A8A8A8');
  static Color kBlackColor = HexColor('#181725');
  static Color kSubtitleColor = HexColor('#7C7C7C');
  static Color kSecondaryColor = HexColor('#F2F3F2');
  static Color kBorderColor = HexColor('#E2E2E2');
  static Color tTitleWhite = HexColor('#FFFFFF');
  static Color tEditProd = HexColor('#C20E08');

  final TextStyle kTitleStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: kBlackColor,
  );

  final TextStyle kDescriptionStyle = TextStyle(
    color: kSubtitleColor,
    fontSize: 13,
  );
}
