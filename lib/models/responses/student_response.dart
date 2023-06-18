import '../requests/student.dart';

class StudentResponse {
  String? firstName;
  String? lastName;
  String? academicYear;
  String? admissionClass;
  String? admissionNumber;
  String? dateOfBirth;
  String? phoneNumber;
  String? fatherName;
  String? motherName;
  String? emailAddress;

  StudentResponse();

  StudentResponse.all(
      this.firstName,
      this.lastName,
      this.academicYear,
      this.admissionClass,
      this.admissionNumber,
      this.dateOfBirth,
      this.phoneNumber,
      this.fatherName,
      this.motherName,
      this.emailAddress);

  StudentResponse.fromJson(Map json) {
    firstName = json["firstName"];
    lastName = json["lastName"];
    academicYear = json["academicYear"];
    admissionClass = json["admissionClass"];
    admissionNumber = json["admissionNumber"];
    dateOfBirth = json["dateOfBirth"];
    phoneNumber = json["phoneNumber"];
    fatherName = json["fatherName"];
    motherName = json["motherName"];
    emailAddress = json["emailAddress"];
  }
  Map toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "academicYear": academicYear,
      "admissionClass": admissionClass,
      "admissionNumber": admissionNumber,
      "dateOfBirth": dateOfBirth,
      "phoneNumber": phoneNumber,
      "fatherName": fatherName,
      "motherName": motherName,
      "emailAddress": emailAddress
    };
  }
}
