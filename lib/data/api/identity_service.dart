
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:flutter_app/interceptors/auth_interceptor.dart';
import 'package:flutter_app/models/responses/auth_response.dart';
import 'package:flutter_app/models/responses/student_response.dart';
import 'package:flutter_app/models/requests/student.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/models/requests/user_login.dart';
import 'package:flutter_app/models/requests/user_register.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class IdentityService {

  static String apiBaseUrl = "http://10.0.2.2:5012/api/v1";
  static IdentityService _singleton = IdentityService._internal();
  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  static Client client = InterceptedClient.build(interceptors: [
    AuthInterceptor(),
  ]);

  factory IdentityService(){
    return _singleton;
  }

  IdentityService._internal();

  static Future<AuthResponse> userRegister(UserRegister userRegister) async {
    AuthResponse authResponse;
    var requestUrl = Uri.parse(apiBaseUrl + "/identity/register");
    var response = await client.post(requestUrl, body: jsonEncode(userRegister),headers: headers);
    dynamic decode = json.decode(response.body);
    authResponse = AuthResponse.fromJson(decode);
    return authResponse;
  }

  static Future<AuthResponse> userLogin(UserLogin userLogin) async {
    AuthResponse authResponse;
    var requestUrl = apiBaseUrl + "/identity/login";
    var response  = await client.post(Uri.parse(requestUrl),body: jsonEncode(userLogin),headers: headers);
    dynamic decode = json.decode(response.body);
    authResponse = AuthResponse.fromJson(decode);
    return authResponse;
  }

  static Future<Student> getStudent() async{
    var requestUrl = apiBaseUrl + "/student/";
    var response = await client.get(Uri.parse(requestUrl),headers: headers);
    var decode = json.decode(response.body);

    return Student.fromJson(decode);
  }

//var response = await Requests.post(
// requestUrl, json: userLogin.toJson(), headers:headers);


}