class Student{
  String? firstName;
  String? lastName;
  String? academicYear;
  String? admissionClass;
  String? admissionNumber;
  DateTime? dateOfBirth;
  String? phoneNumber;
  String? fatherName;
  String? motherName;
  String? emailAddress;

  Student();

  Student.all(this.firstName,
      this.lastName,
      this.academicYear,
      this.admissionClass,
      this.admissionNumber,
      this.dateOfBirth,
      this.phoneNumber,
      this.fatherName,
      this.motherName,
      this.emailAddress);

  Student.fromJson(Map json){
    firstName = json["firstName"];
    lastName = json["lastName"];
    academicYear = json["academicYear"];
    admissionClass = json["admissionClass"];
    admissionNumber = json["admissionNumber"];
    dateOfBirth = DateTime.parse(json["dateOfBirth"]);
    phoneNumber = json["phoneNumber"];
    fatherName = json["fatherName"];
    motherName = json["motherName"];
    emailAddress = json["emailAddress"];
  }
  Map toJson(){
    return {
      "firstName": firstName,
      "lastName": lastName,
      "academicYear": academicYear,
      "admissionClass": admissionClass,
      "admissionNumber": admissionNumber,
      "dateOfBirth": dateOfBirth.toString(),
      "phoneNumber": phoneNumber,
      "fatherName": fatherName,
      "motherName": motherName,
      "emailAddress": emailAddress
    };
  }
}