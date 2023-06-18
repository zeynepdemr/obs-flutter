import 'dart:async';

import 'package:flutter_app/models/responses/exam_response.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:flutter_app/data/api/identity_service.dart';
import 'package:flutter_app/helper/auth_helper.dart';
import 'package:flutter_app/interceptors/auth_interceptor.dart';
import 'package:flutter_app/models/responses/auth_response.dart';
import 'package:flutter_app/models/requests/student.dart';
import 'package:flutter_app/models/requests/user_login.dart';
import 'package:flutter_app/models/requests/user_register.dart';
import 'package:http/http.dart' as http;

import '../data/api/student_service.dart';

class UserBloc {
  final userStreamController = StreamController.broadcast();

  Stream get getStream => userStreamController.stream;
   Client client =  InterceptedClient.build(interceptors: [
    AuthInterceptor(),
  ]);

  Future userRegister(UserRegister userRegister) async {
    AuthResponse authResponse = await IdentityService.userRegister(userRegister);
    if (authResponse.token != null) {
      AuthHelper.setToken(authResponse.token!);
    }
    userStreamController.sink.add(IdentityService.getStudent());

  }

  Future loginUser(UserLogin userLogin) async {
    AuthResponse authResponse = await IdentityService.userLogin(userLogin);
    if (authResponse.token != null) {
      AuthHelper.setToken(authResponse.token!);
    }
    userStreamController.sink.add(IdentityService.getStudent());
  }

  Future<bool> isLogin() async {
    return await AuthHelper.isLogin();
  }

  Future<Student> getStudent() async {
   return await IdentityService.getStudent();
  }

  Future<List<ExamResponse>> getExam() async {
    return await StudentService.getExam();
  }
}

final userBloc = UserBloc();
