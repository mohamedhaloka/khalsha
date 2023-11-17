import 'package:get_storage/get_storage.dart';

import 'package:khalsha/core/data/source/local/core_local_data_source.dart';

class IntroHintCountLocal extends CoreLocalDataSource<int, int> {
  IntroHintCountLocal._();

  static IntroHintCountLocal instance = IntroHintCountLocal._();

  var storage = GetStorage();

  @override
  Future<void> save(int data) => storage.write('into_count', data);

  @override
  int get() {
    int? locale = storage.read('into_count');
    return locale ?? 0;
  }

  @override
  void remove() {
    storage.remove('into_count');
  }
}
