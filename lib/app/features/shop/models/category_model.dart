import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {

  final String id, name, image, parentId;
  final bool isFeatured;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
     this.parentId='',
    required this.isFeatured,
  });

  static CategoryModel empty() => CategoryModel(
        id: '',
        name: "",
        image: "",
        parentId: "",
        isFeatured: false,
      );

  // fromSnapshot
  factory CategoryModel.fromSnapshot(DocumentSnapshot snapshot) {
    return CategoryModel(
      id: snapshot['id']  ?? '',
      name: snapshot['name'] ?? '',
      image: snapshot['image'] ?? '',
      parentId: snapshot['parentId'] ?? '',
      isFeatured: snapshot['isFeatured'] ?? false,
    );
  }

  // toMap
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'parentId': parentId,
      'isFeatured': isFeatured,
    };
  }

  // copyWith
  CategoryModel copyWith({
    String? id,
    String? name,
    String? image,
    String? parentId,
    bool? isFeatured,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      parentId: parentId ?? this.parentId,
      isFeatured: isFeatured ?? this.isFeatured,
    );
  }

  // toString
  @override
  String toString() {
    return 'CategoryModel(id: $id, name: $name, image: $image, parentId: $parentId, isFeatured: $isFeatured)';
  }
}
