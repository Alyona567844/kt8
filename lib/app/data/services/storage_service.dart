import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StorageService extends GetxService {
  late Box box;
  Future<void> clear() async => await box.clear();
  
  String getRefresh() => _readData('Refresh') ?? "";
  
  Future<void> writeRefresh(String token) => _writeData('Refresh', token);

  Future<void> _writeData(String key, String value) => box.put(key, value);
  
  String? _readData(String key) => box.get(key);
  
  Future<StorageService> init() async {
    await Hive.initFlutter();
    box = await Hive.openBox('kt');
    return this;
  }
}
