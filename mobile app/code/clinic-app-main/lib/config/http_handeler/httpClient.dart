import 'package:clinicapp/models/book_model.dart';
import 'package:clinicapp/models/posstion_model.dart';
import 'package:clinicapp/models/prep_model.dart';
import 'package:clinicapp/models/user_model.dart';
import 'package:clinicapp/services/secure_sorage_service/secure_sorage_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class HttpClient {
  Dio dio = Dio();
  final SecureStorageService _secureStorageService = SecureStorageService();

  String baseURL = 'http://10.0.2.2:8000/api/';

  Map<String, dynamic> headers = {
    "Accept": "application/json",
    "Content-Type": "application/json",
    "Authorization": "",
  };

  HttpClient() {
    dio.options.baseUrl = baseURL;
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);
    dio.options.headers = headers;
  }

  Future setToken(String token) async {
    headers["Authorization"] = "Bearer $token";
    dio.options.headers = headers;
    await _secureStorageService.setToken(token);
  }

  Future<void> setSavedToken() async {
    String token = await _secureStorageService.getToken() ?? "";

    headers["Authorization"] = "Bearer $token";
    dio.options.headers = headers;
  }

//   Future post(String url, Map data) async {
//     try {
//       return await dio.post(url, data: data);
//     } on DioError catch (e) {
//       return e.response;
//     }
//   }

//   //AuthCheck
//   Future authCheck() async {
//     Response response = await post('/auth/check', {});
//     return {
//       "code": response.statusCode,
//       "data": response.data,
//     };
//   }

  //Signin
  Future<bool> signIn(String username, String password) async {
    final reqData = {"login": username, "password": password};
    try {
      const endpoint = 'login';
      Response response = await dio.post(endpoint, data: reqData);
      print(response.data);
      var resposndata = response.data['data'];
      if (response.statusCode == 200 || response.statusCode == 201) {
        final user = UserModel.fromMap(resposndata['user']);
        final token = resposndata['token'];
        await setToken(token);
        await _secureStorageService.setUserData(user);
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return false;
    }
  }

  //Signin
  Future<bool> signUp(UserModel model) async {
    try {
      const endpoint = 'register';
      Response response = await dio.post(endpoint, data: model.toMap());
      print(response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var resposndata = response.data['data'];
        final user = UserModel.fromMap(resposndata['user']);
        final token = resposndata['token'];
        await setToken(token);
        await _secureStorageService.setUserData(user);
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return false;
    }
  }

  //Signout
  Future<bool> signOut() async {
    try {
      await setSavedToken();
      const endpoint = 'logout';
      Response response = await dio.post(endpoint, data: {});
      print(response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        await _secureStorageService.clearData();
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return false;
    }
  }

//Add booking
  Future<bool> createbooking(BookModel model) async {
    try {
      await setSavedToken();
      const endpoint = 'addchanel';
      Response response = await dio.post(endpoint, data: model.toMap());
      print(response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return false;
    }
  }

//Add prep
  Future<bool> createPrep(PrepModel model) async {
    try {
      await setSavedToken();
      const endpoint = 'addchanel';
      Response response = await dio.post(endpoint, data: model.toMap());
      print(response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return false;
    }
  }

//get all booking
  Future<List<BookModel>> getbookings() async {
    List<BookModel> booklist = [];
    try {
      await setSavedToken();
      const endpoint = 'checkchennels';
      Response response = await dio.post(endpoint, data: {});
      print(response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var resposndata = response.data['data'];

        final list = resposndata['chanels'] as List;
        list.forEach((element) {
          booklist.add(BookModel.fromMap(element));
        });
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return booklist;
  }

  Future<List<PrepModel>> getPreps() async {
    List<PrepModel> booklist = [];
    try {
      await setSavedToken();
      const endpoint = 'checkprep';
      Response response = await dio.post(endpoint, data: {});
      print(response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var resposndata = response.data['data'];

        final list = resposndata['preps'] as List;
        list.forEach((element) {
          booklist.add(PrepModel.fromMap(element));
        });
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return booklist;
  }
//get posstion

  Future<PossitionModel?> getPossition(int id) async {
    final reqData = {
      "id": id,
    };
    try {
      await setSavedToken();
      const endpoint = 'yettogo';
      Response response = await dio.post(endpoint, data: reqData);
      print(response.data);
      var resposndata = response.data['data'];
      if (response.statusCode == 200 || response.statusCode == 201) {
        final posstion = PossitionModel.fromMap(resposndata);

        return posstion;
      } else {
        return null;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }

//Add issue
  Future<bool> createIssue(String message) async {
    try {
      await setSavedToken();
      const endpoint = 'sendcontact';
      Response response = await dio.post(endpoint, data: {"message": message});
      print(response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return false;
    }
  }

  Future<bool> deleteBooking(int id) async {
    try {
      await setSavedToken();
      const endpoint = 'deletechanel';
      Response response = await dio.post(endpoint, data: {"id": id});
      print(response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return false;
    }
  }
}

HttpClient httpClient = HttpClient();
