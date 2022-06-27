import 'package:crud2/app/util/size_util.dart';

extension SizerExt on double {
  //How to use

  //Whenever you use height then use this method like this => [20.0.h]
  double get h => SizeUtil.height(this);

  //Whenever you use width then use this method like this => [10.0.h]
  double get w => SizeUtil.width(this);

  //Whenever you use text size then use this method like this => [5.0.sp]
  double get sp => SizeUtil.sp(this);
}
