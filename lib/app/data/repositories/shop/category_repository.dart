import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/app/features/shop/models/category_model.dart';
import 'package:get/get.dart';

import '../../../utils/helpers/cloud_helper_functions.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to FireStore.
  Future<List<CategoryModel>> getAllCategories() async {
    return await CCloudHelperFunctions.safeCall(() async {
      final snapshot = await _db.collection("Categories").get();
      return snapshot.docs.map((r) => CategoryModel.fromSnapshot(r)).toList();
    });
  }
}
