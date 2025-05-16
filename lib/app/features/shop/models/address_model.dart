import 'package:cloud_firestore/cloud_firestore.dart';

class AddressModel {
  final String id;
  final String name;
  final String phoneNumber;
  final String street;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final DateTime? dateTime;
  final bool selectedAddress;

  AddressModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    this.dateTime,
    this.selectedAddress = false,
  });

  factory AddressModel.fromSnapshot(DocumentSnapshot json) {
    return AddressModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      street: json['street'] ?? '',
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      postalCode: json['postalCode'] ?? '',
      country: json['country'] ?? '',
      dateTime: json['dateTime'] != null ? DateTime.parse(json['dateTime']) : null,
      selectedAddress: json['selectedAddress'] ?? false,
    );
  }

  /// 👇 Static empty instance
  factory AddressModel.empty() {
    return AddressModel(
      id: '',
      name: '',
      phoneNumber: '',
      street: '',
      city: '',
      state: '',
      postalCode: '',
      country: '',
      dateTime: null,
      selectedAddress: false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'street': street,
      'city': city,
      'state': state,
      'postalCode': postalCode,
      'country': country,
      'dateTime': dateTime?.toIso8601String(),
      'selectedAddress': selectedAddress,
    };
  }
}
