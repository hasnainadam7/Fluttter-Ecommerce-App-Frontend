import 'package:ecommerceapp/app/features/shop/controllers/product_controllers/image_slider_controller.dart';
import 'package:get/get.dart';

import '../../models/product_model.dart';

class VariationController extends GetxController {
  static VariationController get instance {
    if (Get.isRegistered<VariationController>()) {
      return Get.find<VariationController>();
    } else {
      try {
        return Get.put(VariationController());
      } catch (e) {
        // fail silently or return null
        rethrow; // ya return null agar null-safe karna hai
      }
    }
  }

  // Variables
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation = ProductVariationModel.empty().obs;

  // -- Select Attribute, and Variation
  void onAttributeSelected(ProductModel product, attributeName, attributeValue) {
    final selectedAttribute = Map<String, dynamic>.from(selectedAttributes);

    selectedAttribute[attributeName] = attributeValue;
    selectedAttributes[attributeName] = attributeValue;

    final selectedVariation = product.productVariations.firstWhere(
      (r) => _isSameAttributeValues(r.attributeValues, selectedAttribute),
      orElse: () => ProductVariationModel.empty(),
    );

    if (selectedVariation.image.isNotEmpty) {
      ImageSliderController.instance.selectedProductImage.value = selectedVariation.image;
    }
    this.selectedVariation.value = selectedVariation;
    getProductVariationStockStatus();
  }

  // -- Check attribute availability / Stock in Variation
  Set<String?> getAttributesAvailabilityInVariation(
    List<ProductVariationModel> variations,
    String attributeName,
  ) {

 final value =  variations
        .where(
          (variation) =>
              // Check Empty / Out of Stock Attributes
              variation.attributeValues[attributeName.toLowerCase()] != null &&
              variation.attributeValues[attributeName.toLowerCase()]!.isNotEmpty &&
              variation.stock > 0,
        )
        .map((variation) => variation.attributeValues[attributeName.toLowerCase()])
        .toSet();
 // print(variations[0].attributeValues[attributeName]);
 return value;
  }

  /// -- Check If selected attributes matches any variation attributes
  bool _isSameAttributeValues(
    Map<String, dynamic> variationAttributes,
    Map<String, dynamic> selectedAttributes,
  ) {
    // If selectedAttributes contains 3 attributes and current variation contains 2 then return.
    if (variationAttributes.length != selectedAttributes.length) return false;

    // If any of the attributes is different then return. e.g. [Green, Large] x [Green, Small]
    for (final key in variationAttributes.keys) {
      // Attributes[key] = Value which could be [Green, Small, Cotton] etc.
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }

    return true;
  }

  // -- Check Product Variation Stock Status
  void getProductVariationStockStatus() {
    variationStockStatus.value = selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  // -- Reset Selected Attributes when switching products
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }
}
