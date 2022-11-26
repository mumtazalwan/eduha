// To parse this JSON data, do
//
//     final dailyQuizzModel = dailyQuizzModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DailyQuizzModel dailyQuizzModelFromJson(String str) => DailyQuizzModel.fromJson(json.decode(str));

String dailyQuizzModelToJson(DailyQuizzModel data) => json.encode(data.toJson());

class DailyQuizzModel {
  DailyQuizzModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  String statusCode;
  String message;
  List<Datum> data;

  factory DailyQuizzModel.fromJson(Map<String, dynamic> json) => DailyQuizzModel(
    statusCode: json["status code"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status code": statusCode,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.courseName,
    required this.quizName,
    required this.quizPath,
    required this.miniDescription,
    required this.question,
    required this.correctAnswear,
    required this.explanation,
    required this.difficulty,
    required this.dyQuizz,
  });

  int id;
  String courseName;
  String quizName;
  String quizPath;
  String miniDescription;
  String question;
  int correctAnswear;
  String explanation;
  int difficulty;
  List<DyQuizz> dyQuizz;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    courseName: json["course_name"],
    quizName: json["quiz_name"],
    quizPath: json["quiz_path"],
    miniDescription: json["mini_description"],
    question: json["question"],
    correctAnswear: json["correct_answear"],
    explanation: json["explanation"],
    difficulty: json["difficulty"],
    dyQuizz: List<DyQuizz>.from(json["dy_quizz"].map((x) => DyQuizz.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "course_name": courseName,
    "quiz_name": quizName,
    "quiz_path": quizPath,
    "mini_description": miniDescription,
    "question": question,
    "correct_answear": correctAnswear,
    "explanation": explanation,
    "difficulty": difficulty,
    "dy_quizz": List<dynamic>.from(dyQuizz.map((x) => x.toJson())),
  };
}

class DyQuizz {
  DyQuizz({
    required this.id,
    required this.text,
    required this.isCorrect,
    required this.getSelection,
  });

  int id;
  String text;
  int isCorrect;
  int getSelection;

  factory DyQuizz.fromJson(Map<String, dynamic> json) => DyQuizz(
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
