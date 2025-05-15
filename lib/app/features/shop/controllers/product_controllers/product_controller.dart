import 'package:ecommerceapp/app/data/repositories/shop/product_repository.dart';
import 'package:ecommerceapp/app/features/shop/controllers/category_controller.dart';
import 'package:ecommerceapp/app/features/shop/models/category_model.dart';
import 'package:ecommerceapp/app/features/shop/models/product_model.dart';
import 'package:get/get.dart';

import '../../../../utils/popups/loaders.dart';

class ProductController extends GetxController {
  static ProductController get instance {
    if (Get.isRegistered<ProductController>()) {
      return Get.find<ProductController>();
    } else {
      try {
        return Get.put(ProductController());
      } catch (e) {
        // fail silently or return null
        rethrow; // ya return null agar null-safe karna hai
      }
    }
  }

  final RxBool isLoading = false.obs;
  final ProductRepository _productRepository = Get.put(ProductRepository());

  final RxList<ProductModel> allProducts = <ProductModel>[].obs;
  final RxList<ProductModel> randomProducts = <ProductModel>[].obs;
  @override
  Future<void> onInit() async {
    Get.put(CategoryController());
    await fetchProducts();

    // print(allProducts[1].title);
    super.onInit();
  }

  /// Function to save category data to FireStore.
  Future<void> fetchProducts() async {
    try {
      //loader
      isLoading.value = true;
      final products = await _productRepository.getAllProducts();

      // Copy of categories
      var categories = CategoryController.instance.allCategories;
      if (categories.isEmpty) {
        await CategoryController.instance.fetchCategories();
        categories = CategoryController.instance.allCategories;
      }
      final updatedProducts =
          products.map((product) {
            CategoryModel? matchingCategory;

            try {
              matchingCategory = categories.firstWhere(
                (category) => category.id == product.categoryId,
              );
            } catch (_) {}

            return matchingCategory != null ? product.copyWith(brand: matchingCategory) : product;
          }).toList();

      allProducts(updatedProducts);

      isLoading.value = false;
    } catch (e) {
      CLoaders.errorSnackBar(title: "Oh Snaps", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
