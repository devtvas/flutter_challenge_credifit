import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:crud2/app/controllers/product_controller.dart';
import 'package:crud2/app/models/product_model.dart';
import 'package:crud2/app/models/product_model_old.dart';
import 'package:crud2/app/repository/product_repository.dart';
import 'package:crud2/app/services/product_service.dart';
import 'package:crud2/app/util/constant_util.dart';
import 'package:crud2/app/util/custom_color.dart';
import 'package:crud2/app/util/media_query.dart';
import 'package:crud2/app/views/category/category_view.dart';
import 'package:crud2/app/views/category/components/category_card.dart';
import 'package:crud2/app/views/home/components/custom_text.dart';
import 'package:crud2/app/views/home/components/list_horizontal.dart';
import 'package:crud2/app/views/product/product_view.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
//repository injection
  final ProductRepository repository = ProductRepository(
    service: ProductService(
      firebaseFirestore: FirebaseFirestore.instance,
    ),
  );
  Connectivity connectivity = Connectivity();

  String connectivityCheck(ConnectivityResult? result) {
    if (result == ConnectivityResult.wifi) {
      return "You are now connected to wifi";
    } else if (result == ConnectivityResult.mobile) {
      return "You are now connected to mobile data";
    } else if (result == ConnectivityResult.ethernet) {
      return "You are now connected to ethernet";
    } else if (result == ConnectivityResult.bluetooth) {
      return "You are now connected to bluetooth";
    } else if (result == ConnectivityResult.none) {
      return "No connection available";
    } else {
      return "No Connection!!";
    }
  }

  final GlobalKey<ScaffoldState> _homeKey = GlobalKey<ScaffoldState>();
  TextEditingController userController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
      stream: connectivity.onConnectivityChanged,
      builder: (context, snapshot) {
        return Scaffold(
            key: _homeKey,
            appBar: AppBar(
              backgroundColor: snapshot.data == ConnectivityResult.none
                  ? Colors.grey
                  : CustomColor.credifit,
              iconTheme: IconThemeData(color: Colors.black),
              title: CustomText(
                text: title,
                size: 20,
                weight: FontWeight.bold,
              ),
              actions: [
                IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      // showBarModalBottomSheet(
                      //   context: context,
                      //   builder: (context) => Container(
                      //     color: Colors.white,
                      //     child: ShoppingCartWidget(),
                      //   ),
                      // );
                    })
              ],
              elevation: 0,
              centerTitle: true,
            ),
            backgroundColor: Colors.white,
            drawer: Drawer(
              child: ListView(
                children: [
                  Obx(() => UserAccountsDrawerHeader(
                      decoration: BoxDecoration(color: Colors.black),
                      accountName: Text(userController.text),
                      accountEmail: Text(userController.text))),
                  ListTile(
                    leading: Icon(Icons.book),
                    title: CustomText(
                      text: "Payments History",
                    ),
                    onTap: () async {
                      // paymentsController.getPaymentHistory();
                    },
                  ),
                  ListTile(
                    onTap: () {
                      // userController.signOut();
                    },
                    leading: Icon(Icons.exit_to_app),
                    title: Text("Log out"),
                  )
                ],
              ),
            ),
            body: Container(
              color: Colors.white30,
              child: buildProd(),
              // child: ProductView(),
            ));
      },
    );
  }

  buildProd() {
    return GetX<ProductController>(
        // initState: (state) {
        //   Get.find<ProductController>().getAll();
        // },
        init: ProductController(repository: repository),
        builder: (state) => state.productsList.length == 0
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text('${state.productsList['title']}'),
                    title: Text('${state.productsList['title']}'),
                    subtitle: Text('${state.productsList['title']}'),
                  );
                },
                itemCount: state.productsList,
              )

        // GridView.count(
        //   crossAxisCount: 2,
        //   childAspectRatio: .63,
        //   padding: const EdgeInsets.all(10),
        //   mainAxisSpacing: 4.0,
        //   crossAxisSpacing: 10,
        //   children: <Widget>[
        //     Container(
        //       child: Text('${state.}'),
        //     ),
        //   ],
        // ),
        );
  }
}
