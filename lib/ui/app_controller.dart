import 'package:flutter/material.dart';
import 'package:transfer/data/I_api_service.dart';

class AppController extends ChangeNotifier {
  final IApiService _apiService;
  var status = AppStatus.initial;

  AppController({required IApiService apiService}) : _apiService = apiService;

  Future<void> processTransfer({required String account, required double amount}) async {
    status = AppStatus.loading;
    notifyListeners();
    try {
      final result = await _apiService.processTransfer(account: account, amount: amount);
      if (result) {
        status = AppStatus.success;
      } else {
        status = AppStatus.failure;
      }
    } catch (e) {
      status = AppStatus.failure;
    } finally {
      notifyListeners();
    }
  }
}

enum AppStatus { loading, success, failure, initial }
