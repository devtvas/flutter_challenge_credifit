import 'package:crud2/app/services/product_service.dart';

class ProductRepository {
  final ProductService service;
  ProductRepository({required this.service}) : assert(service != null);
  //
  getAll() {
    return service.getAll();
  }
}
