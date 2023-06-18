class UserRegister{
  String? email;
  String? password;
  String? phoneNumber;
  String? firstName;
  String? lastName;

  UserRegister();
  UserRegister.all(this.email, this.password, this.phoneNumber, this.firstName,
      this.lastName);

  UserRegister.fromJson(Map json){
    email =  json["email"];
    password = json["password"];
    phoneNumber = json["phoneNumber"];
    firstName = json["firstName"];
    lastName = json["lastName"];

  }
  Map toJson(){
    return {
      "email":email,
      "password":password,
      "phoneNumber":phoneNumber,
      "firstName":firstName,
      "lastName":lastName,
    };
  }
}