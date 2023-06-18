class AuthResponse{
  String? token;
  String? expiration;

  AuthResponse();
  AuthResponse.all(this.token, this.expiration);


  AuthResponse.fromJson(Map json){
    token =  json["token"];
    //expiration = json["expiration"];
  }
  Map toJson(){
    return {
      "token":token
    };
  }
}