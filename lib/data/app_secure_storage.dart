import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:transfer/data/I_secure_storage.dart';

class AppSecureStorage implements ISecureStorage {
  final _storage = const FlutterSecureStorage();

  @override
  Future<void> add({required String key, required String? value}) => _storage.write(key: key, value: value);
}
