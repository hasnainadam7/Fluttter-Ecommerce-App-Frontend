import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/app/features/shop/models/category_model.dart';
import 'package:ecommerceapp/app/features/shop/models/promo_banner_model.dart';
import 'package:get/get.dart';

import '../../../utils/helpers/cloud_helper_functions.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save fetch data to FireStore.
  Future<List<PromoBannerModel>> getAllPromoBanners() async {
    return await CCloudHelperFunctions.safeCall(() async {
      final snapshot = await _db.collection("PromoBanners").get();
      return snapshot.docs.map((r) => PromoBannerModel.fromSnapshot(r)).toList();
    });
  }
}
