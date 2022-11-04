// To parse this JSON data, do
//
//     final dailyQuizzModel = dailyQuizzModelFromJson(jsonString);

import 'dart:convert';

DailyQuizzModel dailyQuizzModelFromJson(String str) => DailyQuizzModel.fromJson(json.decode(str));

String dailyQuizzModelToJson(DailyQuizzModel data) => json.encode(data.toJson());

class DailyQuizzModel {
  DailyQuizzModel({
    required this.statusCode,
    required this.message,
    required this.learningPath,
  });

  String statusCode;
  String message;
  List<LearningPath> learningPath;

  factory DailyQuizzModel.fromJson(Map<String, dynamic> json) => DailyQuizzModel(
    statusCode: json["status code"],
    message: json["message"],
    learningPath: List<LearningPath>.from(json["learning_path"].map((x) => LearningPath.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status code": statusCode,
    "message": message,
    "learning_path": List<dynamic>.from(learningPath.map((x) => x.toJson())),
  };
}

class LearningPath {
  LearningPath({
    required this.id,
    required this.courseName,
    required this.quizName,
    required this.quizPath,
    required this.miniDescription,
    required this.question,
    required this.selection1,
    required this.selection2,
    required this.selection3,
    required this.correctAnswear,
    required this.explanation,
  });

  int id;
  String courseName;
  String quizName;
  String quizPath;
  String miniDescription;
  String question;
  String selection1;
  String selection2;
  String selection3;
  String correctAnswear;
  String explanation;

  factory LearningPath.fromJson(Map<String, dynamic> json) => LearningPath(
    id: json["id"],
    courseName: json["course_name"],
    quizName: json["quiz_name"],
    quizPath: json["quiz_path"],
    miniDescription: json["mini_description"],
    question: json["question"],
    selection1: json["selection1"],
    selection2: json["selection2"],
    selection3: json["selection3"],
    correctAnswear: json["correct_answear"],
    explanation: json["explanation"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "course_name": courseName,
    "quiz_name": quizName,
    "quiz_path": quizPath,
    "mini_description": miniDescription,
    "question": question,
    "selection1": selection1,
    "selection2": selection2,
    "selection3": selection3,
    "correct_answear": correctAnswear,
    "explanation": explanation,
  };
}
