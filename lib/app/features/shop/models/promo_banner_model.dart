import 'package:cloud_firestore/cloud_firestore.dart';

class PromoBannerModel {
  final String id, banner;
  PromoBannerModel({required this.id, required this.banner});
  factory PromoBannerModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return PromoBannerModel(id: snapshot.id, banner: data['banner'] ?? '');
  }


}
