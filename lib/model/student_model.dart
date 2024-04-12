class StudentRestModel {
  List<StudentModel>? studentList;

  StudentRestModel({
    this.studentList,
  });

  factory StudentRestModel.fromJson(Map<String, dynamic> json) =>
      StudentRestModel(
        studentList: json["studentList"] == null
            ? []
            : List<StudentModel>.from(
                json["studentList"]!.map((x) => StudentModel.fromJson(x))),
      );
}

class StudentModel {
  String? name;
  String? place;
  int? age;
  String? ph;
  String? batch;

  StudentModel({
    this.name,
    this.place,
    this.age,
    this.ph,
    this.batch,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
        name: json["name"],
        place: json["place"],
        age: json["age"],
        ph: json["ph"],
        batch: json["batch"],
      );
}
