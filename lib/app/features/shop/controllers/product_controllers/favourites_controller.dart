import 'dart:convert';

import 'package:ecommerceapp/app/data/repositories/shop/product_repository.dart';
import 'package:ecommerceapp/app/features/shop/models/product_model.dart';
import 'package:get/get.dart';

import '../../../../utils/local_storage/storage_utility.dart';
import '../../../../utils/popups/loaders.dart';

class FavouriteController extends GetxController {
  static FavouriteController get instance {
    if (Get.isRegistered<FavouriteController>()) {
      return Get.find<FavouriteController>();
    } else {
      try {
        return Get.put(FavouriteController());
      } catch (e) {
        rethrow; // ya return null agar null-safe karna hai
      }
    }
  }
  /// Variables
  final favorites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavorites();
  }

  // Method to initialize favorites by reading from storagex
  Future<void> initFavorites() async {
    final json = CLocalStorage.instance.readData('favorites');
    if (json != null) {
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String productId) {
    return favorites[productId] ?? false;
  }

  void toggleFavouriteProduct(String productId) {
    if (!favorites.containsKey(productId)) {
      favorites[productId] = true;
      saveFavouritesStroage();
      CLoaders.customToast(message: "Product has been added to wishlist");
    }else{
      CLocalStorage.instance.removeData(productId);
      favorites.remove(productId);
      saveFavouritesStroage();
      favorites.refresh();
      CLoaders.customToast(message: "Product has been removed from wishlist ");
    }
  }

  void saveFavouritesStroage(){
    final encodedFavouirtes = json.encode(favorites);
    CLocalStorage.instance.saveData("favorites", encodedFavouirtes);
  }
  Future<List<ProductModel>> favouriteProducts()async{
    return await ProductRepository.instance.getFavouriteProducts(favorites.keys.toList());
  }
}
