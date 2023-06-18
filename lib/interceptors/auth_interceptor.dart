import 'package:http_interceptor/http_interceptor.dart';
import 'package:flutter_app/helper/auth_helper.dart';

class AuthInterceptor implements InterceptorContract{
  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    try {
      request.headers["Content-Type"] = "application/json";
      request.headers["Authorization"] = "Bearer " + (await AuthHelper.sharedPreferences).getString("token")!;
    } catch (e) {
      print(e);
    }
    return request;
  }

  @override
  Future<BaseResponse> interceptResponse({required BaseResponse response}) async {
    return response;
  }

  @override
  Future<bool> shouldInterceptRequest() async {
    return true;
  }

  @override
  Future<bool> shouldInterceptResponse() async {
    return true;
  }
}