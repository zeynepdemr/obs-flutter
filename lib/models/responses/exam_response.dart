

class ExamResponse {
  int? point;
  String? grade;
  LectureResponse? lecture;

  ExamResponse();

  ExamResponse.all(
      this.point,
      this.grade,
      this.lecture);

  ExamResponse.fromJson(Map json) {
    point = json["point"];
    grade = json["grade"];
    lecture = LectureResponse.fromJson(json["lecture"]);
  }
  Map toJson() {
    return {
      "point": point,
      "grade": grade,
      "lecture": lecture
    };
  }
}


class LectureResponse{
  String? id;
  String? name;

  LectureResponse();
  LectureResponse.all(
      this.id,
      this.name);

  LectureResponse.fromJson(Map json) {
    id = json["id"];
    name = json["name"];
  }
}