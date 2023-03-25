import 'package:clinicapp/models/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  late final FlutterSecureStorage storage;

  SecureStorageService() {
    storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
  }

  Future<bool> setToken(String token) async {
    try {
      await storage.write(key: "token", value: token);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String?> getToken() async {
    try {
      String? token = await storage.read(key: "token");
      return token;
    } catch (e) {
      return null;
    }
  }

  Future<bool> setUserData(UserModel userModel) async {
    try {
      await storage.write(key: "id", value: userModel.id!.toString());
      await storage.write(key: "name", value: userModel.name);
      await storage.write(key: "surname", value: userModel.surName);
      await storage.write(key: "email", value: userModel.email);
      await storage.write(key: "dob", value: userModel.dateOfBirth);
      await storage.write(key: "phone", value: userModel.phone);
      await storage.write(key: "pno", value: userModel.patientNo);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<UserModel?> getUserData() async {
    try {
      final id = await storage.read(key: "id");
      final name = await storage.read(key: "name");
      final surName = await storage.read(key: "surname");
      final email = await storage.read(key: "email");
      final dob = await storage.read(key: "dob");
      final phone = await storage.read(key: "phone");
      final pno = await storage.read(key: "pno");

      final user = UserModel(
          name: name!,
          email: email!,
          surName: surName!,
          dateOfBirth: dob!,
          phone: phone!,
          id: int.parse(id!),
          patientNo: pno!);
      return user;
    } catch (e) {
      return null;
    }
  }

  Future<bool> clearData() async {
    try {
      await storage.deleteAll();
      return true;
    } catch (e) {
      return false;
    }
  }
}
