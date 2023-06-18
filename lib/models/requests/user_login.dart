class UserLogin{
  String? email;
  String? password;

  UserLogin();
  UserLogin.all(this.email, this.password);


  UserLogin.fromJson(Map json){
    email =  json["email"];
    password = json["password"];
  }
  Map toJson(){
    return {
      "email":email,
      "password":password
    };
  }
}