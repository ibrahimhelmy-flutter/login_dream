import 'package:get_storage/get_storage.dart';

class Box {

  static var storage = GetStorage();

  static save({required key, required value}) {
    storage.write(key, value);
  }

  static get({required key}) {
    return  storage.read(key);
  }

  static remove({required key}) async{
    return await storage.remove(key);
  }

}

