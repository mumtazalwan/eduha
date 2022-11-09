// To parse this JSON data, do
//
//     final detailCourseModel = detailCourseModelFromJson(jsonString);

import 'package:meta/meta.dart';
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
    required this.selection,
    required this.idExercise,
    required this.exerciseImg,
    required this.exerciseTitle,
    required this.exerciseDesc,
    required this.correctAnswear,
    required this.foExe,
  });

  int id;
  String question;
  int selection;
  int idExercise;
  String exerciseImg;
  String exerciseTitle;
  String exerciseDesc;
  int correctAnswear;
  List<FoExe> foExe;

  factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
    id: json["id"],
    question: json["question"],
    selection: json["selection"],
    idExercise: json["idExercise"],
    exerciseImg: json["exercise_img"],
    exerciseTitle: json["exercise_title"],
    exerciseDesc: json["exercise_desc"],
    correctAnswear: json["correct_answear"],
    foExe: List<FoExe>.from(json["fo_exe"].map((x) => FoExe.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "question": question,
    "selection": selection,
    "idExercise": idExercise,
    "exercise_img": exerciseImg,
    "exercise_title": exerciseTitle,
    "exercise_desc": exerciseDesc,
    "correct_answear": correctAnswear,
    "fo_exe": List<dynamic>.from(foExe.map((x) => x.toJson())),
  };
}

class FoExe {
  FoExe({
    required this.id,
    required this.text,
    required this.isCorrect,
    required this.getSelection,
  });

  int id;
  String text;
  int isCorrect;
  int getSelection;

  factory FoExe.fromJson(Map<String, dynamic> json) => FoExe(
    id: json["id"],
    text: json["Text"],
    isCorrect: json["isCorrect"],
    getSelection: json["get_selection"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "Text": text,
    "isCorrect": isCorrect,
    "get_selection": getSelection,
  };
}
