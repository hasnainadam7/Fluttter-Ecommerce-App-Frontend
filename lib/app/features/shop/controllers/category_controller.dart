import 'package:ecommerceapp/app/data/repositories/shop/category_repository.dart';
import 'package:ecommerceapp/app/features/shop/models/category_model.dart';
import 'package:ecommerceapp/app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  // static CategoryController get instance => Get.find();


  static CategoryController get instance {
    if (Get.isRegistered<CategoryController>()) {
      return Get.find<CategoryController>();
    } else {
      try {
        return Get.put(CategoryController());
      } catch (e) {
        // fail silently or return null
        rethrow; // ya return null agar null-safe karna hai
      }
    }
  }

  final RxBool isLoading = false.obs;
  final CategoryRepository _categoryRepository = Get.put(CategoryRepository());
  final RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  final RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  @override
  void onInit()async {
    await fetchCategories();
    super.onInit();
  }

  /// Function to save category data to FireStore.
  Future<void> fetchCategories() async {
    try {
      //loader
      isLoading.value = true;
  final categories =await _categoryRepository.getAllCategories();
      allCategories(categories);
      // Filter featured ones

      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured).toList());

      isLoading.value = false;
    } catch (e) {
      CLoaders.errorSnackBar(title: "Oh Snaps", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
