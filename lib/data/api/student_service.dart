import 'package:flutter_app/models/responses/exam_response.dart';
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

class StudentService {

  static String apiBaseUrl = "http://10.0.2.2:5012/api/v1";
  static StudentService _singleton = StudentService._internal();
  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  static Client client = InterceptedClient.build(interceptors: [
    AuthInterceptor(),
  ]);

  factory StudentService(){
    return _singleton;
  }

  StudentService._internal();

  static Future<List<ExamResponse>> getExam() async{
    var requestUrl = apiBaseUrl + "/student/exams";
    var response = await client.get(Uri.parse(requestUrl),headers: headers);
    var decode = json.decode(response.body);

    List<ExamResponse> exams = List<ExamResponse>.empty(growable: true);

    for(var exam in decode){
      exams.add(ExamResponse.fromJson(exam));
    }

    return exams;
  }

//var response = await Requests.post(
// requestUrl, json: userLogin.toJson(), headers:headers);


}