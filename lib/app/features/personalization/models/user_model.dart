import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../utils/formatters/formatters.dart';
import 'dart:math';

/// Model class representing user data.
class UserModel {
  // keep those values "final" which don't want to update
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  /// Constructor for UserModel.
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  /// Helper function to get the full name.
  String get fullName => '$firstName $lastName';

  /// Helper function to format phone number.
  String get formattedPhoneNo => CFormatter.formatPhoneNumber(phoneNumber);

  /// Static function to split full name into first & last name.
  static List<String> nameParts(fullName) => fullName.split(" ");

  /// Static function to generate a username from the full name.

  static String generateUsername(String fullName) {
    final random = Random();
    List<String> nameParts = fullName.trim().split(RegExp(r"\s+"));

    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    // Sanitize to remove special characters
    String sanitizedFirstName = firstName.replaceAll(RegExp(r'[^a-z0-9]'), '');
    String sanitizedLastName = lastName.replaceAll(RegExp(r'[^a-z0-9]'), '');

    // Add a random number (3 digits) to avoid duplication
    int randomDigits = 100 + random.nextInt(900); // gives 100-999

    String username = "algoace_${sanitizedFirstName}_${sanitizedLastName}_$randomDigits";

    return username;
  }

  /// Static function to create an empty user model.
  static UserModel empty() => UserModel(
    id: '',
    firstName: '',
    lastName: '',
    username: '',
    email: '',
    phoneNumber: '',
    profilePicture: '',
  );

  /// Convert model to JSON structure for storing data in Firebase.
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }
  UserModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? username,
    String? email,
    String? phoneNumber,
    String? profilePicture,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      username: username ?? this.username,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }


  /// Factory method to create a UserModel from a Firebase document snapshot.
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data == null) {
      throw Exception("User data not found");
    }

    return UserModel(
      id: document.id,
      firstName: data['FirstName'] ?? '',
      lastName: data['LastName'] ?? '',
      username: data['Username'] ?? '',
      email: data['Email'] ?? '',
      phoneNumber: data['PhoneNumber'] ?? '',
      profilePicture: data['ProfilePicture'] ?? '',
    );
  }


}
