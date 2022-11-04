// To parse this JSON data, do
//
//     final detailCourseModel = detailCourseModelFromJson(jsonString);

import 'dart:convert';

DetailCourseModel detailCourseModelFromJson(String str) => DetailCourseModel.fromJson(json.decode(str));

String detailCourseModelToJson(DetailCourseModel data) => json.encode(data.toJson());

class DetailCourseModel {
  DetailCourseModel({
    required this.status,
    required this.message,
    required this.courseFoundation,
    required this.exercise,
  });

  String status;
  String message;
  List<CourseFoundation> courseFoundation;
  List<Exercise> exercise;

  factory DetailCourseModel.fromJson(Map<String, dynamic> json) => DetailCourseModel(
    status: json["status"],
    message: json["message"],
    courseFoundation: List<CourseFoundation>.from(json["course_foundation"].map((x) => CourseFoundation.fromJson(x))),
    exercise: List<Exercise>.from(json["exercise"].map((x) => Exercise.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "course_foundation": List<dynamic>.from(courseFoundation.map((x) => x.toJson())),
    "exercise": List<dynamic>.from(exercise.map((x) => x.toJson())),
  };
}

class CourseFoundation {
  CourseFoundation({
    required this.id,
    required this.imgPath,
    required this.mainTitle,
    required this.mainDescription,
    required this.materialName,
    required this.description,
    required this.getSubmaterial,
  });

  int id;
  String imgPath;
  String mainTitle;
  String mainDescription;
  String materialName;
  String description;
  int getSubmaterial;

  factory CourseFoundation.fromJson(Map<String, dynamic> json) => CourseFoundation(
    id: json["id"],
    imgPath: json["img_path"],
    mainTitle: json["main_title"],
    mainDescription: json["main_description"],
    materialName: json["material_name"],
    description: json["description"],
    getSubmaterial: json["get_submaterial"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "img_path": imgPath,
    "main_title": mainTitle,
    "main_description": mainDescription,
    "material_name": materialName,
    "description": description,
    "get_submaterial": getSubmaterial,
  };
}

class Exercise {
  Exercise({
    required this.id,
    required this.question,
    required this.selection1,
    required this.selection2,
    required this.selection3,
    required this.selection4,
    required this.correctAnswear,
    required this.idExercise,
    required this.exerciseImg,
    required this.exerciseTitle,
    required this.exerciseDesc,
  });

  int id;
  String question;
  String selection1;
  String selection2;
  String selection3;
  String selection4;
  String correctAnswear;
  int idExercise;
  String exerciseImg;
  String exerciseTitle;
  String exerciseDesc;

  factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
    id: json["id"],
    question: json["question"],
    selection1: json["selection1"],
    selection2: json["selection2"],
    selection3: json["selection3"],
    selection4: json["selection4"],
    correctAnswear: json["correct_answear"],
    idExercise: json["idExercise"],
    exerciseImg: json["exercise_img"],
    exerciseTitle: json["exercise_title"],
    exerciseDesc: json["exercise_desc"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "question": question,
    "selection1": selection1,
    "selection2": selection2,
    "selection3": selection3,
    "selection4": selection4,
    "correct_answear": correctAnswear,
    "idExercise": idExercise,
    "exercise_img": exerciseImg,
    "exercise_title": exerciseTitle,
    "exercise_desc": exerciseDesc,
  };
}
