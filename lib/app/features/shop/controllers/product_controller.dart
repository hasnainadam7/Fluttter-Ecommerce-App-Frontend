import 'package:ecommerceapp/app/data/repositories/shop/banner_repository.dart';
import 'package:ecommerceapp/app/data/repositories/shop/product_repository.dart';
import 'package:ecommerceapp/app/features/shop/controllers/category_controller.dart';
import 'package:ecommerceapp/app/features/shop/models/product_model.dart';
import 'package:ecommerceapp/app/features/shop/models/promo_banner_model.dart';
import 'package:get/get.dart';

import '../../../data/repositories/shop/category_repository.dart';
import '../../../utils/popups/loaders.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final RxBool isLoading = false.obs;
  final ProductRepository _productRepository = Get.put(ProductRepository());
  final RxList<ProductModel> allProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchCategories();

    // print(allProducts[1].title);
    super.onInit();
  }

  /// Function to save category data to FireStore.
  Future<void> fetchCategories() async {
    try {
      //loader
      isLoading.value = true;
      final products = await _productRepository.getAllProducts();

      // Copy of categories
      final categories = CategoryController.instance.allCategories;

      // Now map over the products and update them with matching category
      final updatedProducts =
          products.map((product) {
            final matchingCategory = categories.firstWhere(
              (category) => category.id == product.categoryId,
            );

            // If found, add it to the 'banners' field using copyWith
            return matchingCategory != null ? product.copyWith(brand: matchingCategory) : product;
          }).toList();

      // Now update the state
      allProducts(updatedProducts);

      isLoading.value = false;
    } catch (e) {
      print(e);
      CLoaders.errorSnackBar(title: "Oh Snaps", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
