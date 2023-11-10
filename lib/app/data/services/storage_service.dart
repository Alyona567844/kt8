import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StorageService extends GetxService {
  late Box box;
  Future<void> clear() async => await box.clear();

  String getRefresh() => _readData('refresh') ?? "";

  Future<void> writeRefresh(String token) => _writeData('refresh', token);

  Future<void> _writeData(String key, String value) => box.put(key, value);

  String? _readData(String key) => box.get(key);

  Future<StorageService> init() async {
    await Hive.initFlutter();
    box = await Hive.openBox('kt');
    return this;
  }
}
