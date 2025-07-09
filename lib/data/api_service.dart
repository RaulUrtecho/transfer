import 'dart:math';

import 'package:transfer/data/I_api_service.dart';
import 'package:transfer/data/I_secure_storage.dart';

class ApiService implements IApiService {
  final ISecureStorage _storage;

  ApiService({required ISecureStorage storage}) : _storage = storage;

  @override
  Future<bool> processTransfer({required String account, required double amount}) async {
    await _storage.add(key: 'token', value: 'asd1234');
    await Future.delayed(Duration(seconds: 3));
    return Random().nextDouble() < 0.7;
  }
}
