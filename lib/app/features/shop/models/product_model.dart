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
  final List<ProductAttribute> productAttributes;
  final List<ProductVariation> productVariations;

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
    List<ProductAttribute>? productAttributes,
    List<ProductVariation>? productVariations,
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
    print(map.data()); // Make sure this has all fields

    final data = map.data() as Map<String, dynamic>;

    return ProductModel(
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
      productType: ProductType.values.firstWhere(
            (e) => e.toString() == data['productType'], // or use `.name` if saved cleanly
        orElse: () => ProductType.single,
      ),
      productAttributes: (data.containsKey('productAttributes') && data['productAttributes'] != null)
          ? (data['productAttributes'] as List).map((e) => ProductAttribute.fromMap(Map<String, dynamic>.from(e))).toList()
          : [],
      productVariations: (data.containsKey('productVariations') && data['productVariations'] != null)
          ? (data['productVariations'] as List).map((e) => ProductVariation.fromMap(Map<String, dynamic>.from(e))).toList()
          : [],
    );
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

class ProductAttribute {
  final String name;
  final List<String> values;

  ProductAttribute({required this.name, required this.values});

  factory ProductAttribute.fromMap(Map<String, dynamic> map) {
    return ProductAttribute(name: map['name'], values: List<String>.from(map['values']));
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'values': values};
  }
}

class ProductVariation {
  final String id;
  final Map<String, String> attributeValues;
  final String description;
  final String image;
  final double price;
  final double salePrice;
  final int stock;
  final String sku;

  ProductVariation({
    required this.id,
    required this.attributeValues,
    required this.description,
    required this.image,
    required this.price,
    required this.salePrice,
    required this.stock,
    required this.sku,
  });

  factory ProductVariation.fromMap(Map<String, dynamic> map) {
    return ProductVariation(
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
