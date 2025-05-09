import 'package:ecommerceapp/app/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CloseAccountButton extends StatelessWidget {
  const CloseAccountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthenticationRepository()) ;
    return Center(
      child: TextButton(
        onPressed: () {
          controller.logout();
        },
        child: const Text("Close Account", style: TextStyle(color: Colors.red)),
      ),
    );
  }
}