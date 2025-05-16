import 'package:ecommerceapp/app/data/repositories/user/address_repository.dart';
import 'package:ecommerceapp/app/features/shop/models/address_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../../utils/constants/images_string.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();
  final TextEditingController name = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController postalCode = TextEditingController();
  final TextEditingController street = TextEditingController();
  final TextEditingController state = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController country = TextEditingController();
  final GlobalKey<FormState> addressFormController = GlobalKey<FormState>();

  final AddressRepository addressRepository = Get.put(AddressRepository());
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final RxList<AddressModel> listAddress = [AddressModel.empty()].obs;
  Future<List<AddressModel>> fetchUserAddress() async {
    try {
      Future.delayed(Duration.zero, () {
        CFullScreenLoader.openLoadingDialog(
          "We are updating your information...",
          CImages.docerAnimation,
        );
      });

      // Check Internet Connectivity
      final bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CLoaders.warningSnackBar(
          title: 'No Internet Connection',
          message: "Please check your internet connection",
        );
        CFullScreenLoader.stopLoading();
      }

      final List<AddressModel> list = await addressRepository.fetchUserAddresses();
      selectedAddress.value = list.firstWhere(
        (ele) => ele.selectedAddress,
        orElse: () => AddressModel.empty(),
      );
      CFullScreenLoader.stopLoading();
      listAddress(list);
      return list;
    } catch (e) {
      print(e);
      CLoaders.customToast(message: "unable to find address");
      return [];
    }
  }

  Future<void> create() async {
    try {
      // Form Validation
      if (!addressFormController.currentState!.validate()) {
        // Remove Loader
        CFullScreenLoader.stopLoading();
        return;
      }

      CFullScreenLoader.openLoadingDialog('We are adding your address...', CImages.docerAnimation);

      // Check Internet Connectivity
      final bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CLoaders.warningSnackBar(
          title: 'No Internet Connection',
          message: "Please check your internet connection",
        );
        CFullScreenLoader.stopLoading();
      }
      final AddressModel addressModel = AddressModel(
        id: const Uuid().v4(),
        name: name.text,
        phoneNumber: phoneNumber.text,
        street: street.text,
        city: city.text,
        state: state.text,
        postalCode: postalCode.text,
        country: country.text,
      );
      await addressRepository.createUserAddress(addressModel);

      CFullScreenLoader.stopLoading();
    } catch (e) {
      CLoaders.customToast(message: "unable to find address");
    }
  }

  Future<void> selectAddress(AddressModel address) async {
    try {


      CFullScreenLoader.openLoadingDialog('We are updating your address...', CImages.docerAnimation);

      // Check Internet Connectivity
      final bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CLoaders.warningSnackBar(
          title: 'No Internet Connection',
          message: "Please check your internet connection",
        );
        CFullScreenLoader.stopLoading();
      }
      // Step 3: Update in app state
      selectedAddress(address);
      // Step 1: Unselect all
      for (final address in listAddress) {
        await addressRepository.updateSelectedAddress(address.id, false);
      }

      // Step 2: Select current
      await addressRepository.updateSelectedAddress(address.id, true);

      CFullScreenLoader.stopLoading();
    } catch (e) {
      CLoaders.errorSnackBar(title: "Error in Selection", message: e.toString());
    }
  }
}
