// ignore_for_file: unrelated_type_equality_checks

import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../popups/loaders.dart';

/// Manages the network connectivity status and provides methods to check and handle connectivity changes.
class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  // late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  /// Initialize the network manager and set up a stream to continually check the connection status.
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 2), () async {
      final result = await _connectivity.checkConnectivity();
      _updateConnectionStatus(result.first);
    });

    // _connectivitySubscription =
    //     _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> results) {
    //       final firstResult = results.isNotEmpty ? results.first : ConnectivityResult.none;
    //       _updateConnectionStatus(firstResult);
    //     });
  }

  /// Update the connection status based on changes in connectivity and show a relevant popup for no internet connection.
  ConnectivityResult? _lastStatus;

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    if (result != _lastStatus) {
      _connectionStatus.value = result;

      if (result == ConnectivityResult.none) {
        CLoaders.warningSnackBar(
          title: 'No Internet Connection',
          message: "Please check your internet connection",
        );
      }

      _lastStatus = result;
    }
  }

  /// Check the internet connection status.
  /// Returns `true` if connected, `false` otherwise.
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();

      if (result == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (e) {
      return false;
    }
  }

  /// Dispose or close the active connectivity stream.
  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
