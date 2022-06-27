import 'package:crud2/app/models/product_model.dart';
import 'package:crud2/app/repository/product_repository.dart';
import 'package:get/get.dart';

class ProductController extends RxController {
  final ProductRepository? repository;
  ProductController({required this.repository}) : assert(repository != null);

  @override
  void onInit() {
    getAll();
    super.onInit();
  }

  final _productsList = <ProductModel>[].obs;

  get productsList => this._productsList.value;

  set productsList(value) => this._productsList.value = value;

  getAll() {
    repository!.getAll().then((data) {
      this.productsList = data;
    });
  }
}
