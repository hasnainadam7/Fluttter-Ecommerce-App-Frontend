import 'package:ecommerceapp/app/features/personalization/controllers/address_controller.dart';
import 'package:ecommerceapp/app/features/shop/models/address_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appBar/app_bar.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../../../utils/validators/validation.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    CHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const CAppBar(showBackArrow: true, title: Text('Add New Address')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Form(
            key: controller.addressFormController,
            child: Column(
              spacing: CSizes.spaceBtwItems,
              children: [
                TextFormField(
                  validator: (value) => CValidator.validateEmptyText('Name', value),
                  controller: controller.name,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: 'Name',
                  ),
                ),

                TextFormField(
                  validator: (value) => CValidator.validateEmptyText('Phone Number', value),
                  controller: controller.phoneNumber,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.mobile),

                    labelText: 'Phone Number',
                  ),
                ),

                Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child: TextFormField(
                        validator: (value) => CValidator.validateEmptyText('Street', value),
                        controller: controller.street,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.building_31),
                          labelText: 'Street',
                        ),
                      ),
                    ),

                    Expanded(
                      child: TextFormField(
                        validator: (value) => CValidator.validateEmptyText('Postal Code', value),
                        controller: controller.postalCode,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.code),
                          labelText: 'Postal Code',
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child: TextFormField(
                        validator: (value) => CValidator.validateEmptyText('City', value),
                        controller: controller.city,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.building),
                          labelText: 'City',
                        ),
                      ),
                    ),

                    Expanded(
                      child: TextFormField(
                        validator: (value) => CValidator.validateEmptyText('State', value),
                        controller: controller.state,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.activity),
                          labelText: 'State',
                        ),
                      ),
                    ),
                  ],
                ),

                TextFormField(
                  validator: (value) => CValidator.validateEmptyText('Country', value),
                  controller: controller.country,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.global),
                    labelText: 'Country',
                  ),
                ),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      await controller.create();
                    },
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
