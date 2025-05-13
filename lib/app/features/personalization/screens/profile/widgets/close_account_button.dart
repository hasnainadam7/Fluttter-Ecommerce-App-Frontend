import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/delete_user_controller.dart';

class CloseAccountButton extends StatelessWidget {
  const CloseAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DeleteUserController());
    return Center(
      child: TextButton(
        onPressed: () {
          CHelperFunctions.showConfirmationDialog(
            title: "Delete",
            message: "Are you sure you want to delete this account?",
            onConfirm: () async => await controller.deleteUser(),
            isDestructive: true,
          );
        },
        child: const Text("Close Account", style: TextStyle(color: Colors.red)),
      ),
    );
  }
}
