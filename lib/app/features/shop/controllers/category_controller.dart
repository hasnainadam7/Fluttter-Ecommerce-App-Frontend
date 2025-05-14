import 'package:ecommerceapp/app/data/repositories/shop/category_repository.dart';
import 'package:ecommerceapp/app/features/shop/models/category_model.dart';
import 'package:ecommerceapp/app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();
  final RxBool isLoading = false.obs;
  final CategoryRepository _categoryRepository = Get.put(CategoryRepository());
  final RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  final RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// Function to save category data to FireStore.
  Future<void> fetchCategories() async {
    try {
      //loader
      isLoading.value = true;

      allCategories(await _categoryRepository.getAllCategories());
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
