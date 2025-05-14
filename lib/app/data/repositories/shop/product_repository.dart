import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/app/features/shop/models/category_model.dart';
import 'package:ecommerceapp/app/features/shop/models/product_model.dart';
import 'package:ecommerceapp/app/features/shop/models/promo_banner_model.dart';
import 'package:get/get.dart';

import '../../../utils/helpers/cloud_helper_functions.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save fetch data to FireStore.
  Future<List<ProductModel>>    getAllProducts() async {
    return await CCloudHelperFunctions.safeCall(() async {
      final snapshot = await _db.collection("Products").get();

      return snapshot.docs.map((r) => ProductModel.fromSnapshot(r)).toList();
    });
  }
}
