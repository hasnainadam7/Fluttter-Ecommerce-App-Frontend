import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/app/data/repositories/authentication/authentication_repository.dart';
import 'package:get/get.dart';
import '../../../features/shop/models/address_model.dart';
import '../../../utils/helpers/cloud_helper_functions.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save fetch data to FireStore.
  Future<List<AddressModel>> fetchUserAddresses() async {
    return await CCloudHelperFunctions.safeCall(() async {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) throw "Unable to find user information. Try again in few minutes";
      final snapshot = await _db.collection("Users").doc(userId).collection("Addresses").get();
      return snapshot.docs.map((r) => AddressModel.fromSnapshot(r)).toList();
    });
  }

  Future<void> createUserAddress(AddressModel address) async {
    await CCloudHelperFunctions.safeCall(() async {
      final userId = AuthenticationRepository.instance.authUser?.uid;
      if (userId == null || userId.isEmpty) {
        throw "User not found. Please login again.";
      }

      final addressRef = _db
          .collection("Users")
          .doc(userId)
          .collection("Addresses")
          .doc(address.id); // auto ID

      await addressRef.set(address.toJson());
    });
  }

  Future<void> updateSelectedAddress(String addressId, bool selected) async {
    return await CCloudHelperFunctions.safeCall(() async {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) throw "Unable to find user information. Try again in few minutes";
      await _db.collection("Users").doc(userId).collection("Addresses").doc(addressId).update({
        "selectedAddress": selected,
      });
    });
  }
}
