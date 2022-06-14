import 'package:intl/intl.dart';

class Validators {
  //*Todo camada de negocio
  static convertIntRatingDouble(dynamic rating) {
    //converter rating int x double
    final int x = rating;
    final double ratingConvertido = x.toDouble();
    return ratingConvertido;
  }

  static formatCasaDecimal(dynamic price) {
    //formatar as casas decimais Ex.: De(28.1) Para(28,10)
    var formatter = new NumberFormat("###,###.00#", "pt_BR");
    dynamic priceModified = formatter.format(price);
    print(priceModified);
    return priceModified;
  }
}
