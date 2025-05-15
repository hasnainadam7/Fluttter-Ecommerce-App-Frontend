import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/app/features/shop/models/category_model.dart';
import 'package:ecommerceapp/app/utils/constants/enums.dart';

class ProductModel {
  final String id;
  final String title;
  final String description;
  final double price;
  final double salePrice;
  final String thumbnail;
  final List<String> images;
  final String categoryId;
  final bool isFeatured;
  final CategoryModel? brand;
  final int stock;
  final String sku;
  final ProductType productType;
  final List<ProductAttributeModel> productAttributes;
  final List<ProductVariationModel> productVariations;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.salePrice,
    required this.thumbnail,
    required this.images,
    required this.categoryId,
    required this.isFeatured,
    required this.stock,
    required this.sku,
    required this.productType,
    required this.productAttributes,
    required this.productVariations,
    this.brand,
  });
  ProductModel copyWith({
    String? id,
    String? title,
    String? description,
    double? price,
    double? salePrice,
    String? thumbnail,
    List<String>? images,
    String? categoryId,
    bool? isFeatured,
    int? stock,
    String? sku,
    ProductType? productType,
    CategoryModel? brand,
    List<ProductAttributeModel>? productAttributes,
    List<ProductVariationModel>? productVariations,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      salePrice: salePrice ?? this.salePrice,
      thumbnail: thumbnail ?? this.thumbnail,
      images: images ?? this.images,
      categoryId: categoryId ?? this.categoryId,
      isFeatured: isFeatured ?? this.isFeatured,
      stock: stock ?? this.stock,
      sku: sku ?? this.sku,
      productType: productType ?? this.productType,
      brand: brand ?? CategoryModel.empty(),
      productAttributes: productAttributes ?? this.productAttributes,
      productVariations: productVariations ?? this.productVariations,
    );
  }

  factory ProductModel.fromSnapshot(DocumentSnapshot map) {
    final data = map.data() as Map<String, dynamic>;

    // More robust approach to handle the enum conversion
    ProductType resolvedProductType;
    if (data['productType'] != null) {
      // Handle the case where data contains the full enum path "ProductType.single"
      String productTypeString = data['productType'].toString();

      // Extract just the enum value part after the dot if it contains "ProductType."
      if (productTypeString.contains('ProductType.')) {
        productTypeString = productTypeString.split('.').last.trim();
      }

      try {
        resolvedProductType = ProductType.values.firstWhere(
              (e) => e.name == productTypeString,
          orElse: () => ProductType.single,
        );
      } catch (e) {
        print("Error matching product type: $e");
        resolvedProductType = ProductType.single; // Default
      }
    } else {
      resolvedProductType = ProductType.single; // Default if null
    }

    ProductModel productModel = ProductModel(
      id: data['id'],
      title: data['title'],
      description: data['description'],
      price: (data['price'] as num).toDouble(),
      salePrice: (data['salePrice'] as num).toDouble(),
      thumbnail: data['thumbnail'],
      images: List<String>.from(data['images']),
      categoryId: data['categoryId'],
      isFeatured: data['isFeatured'],
      stock: data['stock'],
      sku: data['sku'],
      productType: resolvedProductType,
      productAttributes:
      (data.containsKey('productAttributes') && data['productAttributes'] != null)
          ? (data['productAttributes'] as List)
          .map((e) => ProductAttributeModel.fromMap(Map<String, dynamic>.from(e)))
          .toList()
          : [],
      productVariations:
      (data.containsKey('productVariations') && data['productVariations'] != null)
          ? (data['productVariations'] as List)
          .map((e) => ProductVariationModel.fromMap(Map<String, dynamic>.from(e)))
          .toList()
          : [],
    );


    return productModel;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'salePrice': salePrice,
      'thumbnail': thumbnail,
      'images': images,
      'categoryId': categoryId,
      'isFeatured': isFeatured,
      'stock': stock,
      'sku': sku,
      'productType': productType,
      'productAttributes': productAttributes.map((e) => e.toMap()).toList(),
      'productVariations': productVariations.map((e) => e.toMap()).toList(),
    };
  }
}

class ProductAttributeModel {
  final String name;
  final List<String> values;

  ProductAttributeModel({required this.name, required this.values});

  factory ProductAttributeModel.fromMap(Map<String, dynamic> map) {
    return ProductAttributeModel(name: map['name'], values: List<String>.from(map['values']));
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'values': values};
  }
}

class ProductVariationModel {
  final String id;
  final Map<String, String> attributeValues;
  final String description;
  final String image;
  final double price;
  final double salePrice;
  final int stock;
  final String sku;

  ProductVariationModel({
    required this.id,
    required this.attributeValues,
    required this.description,
    required this.image,
    required this.price,
    required this.salePrice,
    required this.stock,
    required this.sku,
  });

  factory ProductVariationModel.fromMap(Map<String, dynamic> map) {
    return ProductVariationModel(
      id: map['id'],
      attributeValues: Map<String, String>.from(map['attributeValues']),
      description: map['description'],
      image: map['image'],
      price: (map['price'] as num).toDouble(),
      salePrice: (map['salePrice'] as num).toDouble(),
      stock: map['stock'],
      sku: map['sku'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'attributeValues': attributeValues,
      'description': description,
      'image': image,
      'price': price,
      'salePrice': salePrice,
      'stock': stock,
      'sku': sku,
    };
  }
}
