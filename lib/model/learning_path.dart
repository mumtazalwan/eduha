// To parse this JSON data, do
//
//     final learningPathModel = learningPathModelFromJson(jsonString);

import 'dart:convert';

LearningPathModel learningPathModelFromJson(String str) => LearningPathModel.fromJson(json.decode(str));

String learningPathModelToJson(LearningPathModel data) => json.encode(data.toJson());

class LearningPathModel {
  LearningPathModel({
    required this.statusCode,
    required this.message,
    required this.learningPath,
  });

  String statusCode;
  String message;
  List<LearningPath> learningPath;

  factory LearningPathModel.fromJson(Map<String, dynamic> json) => LearningPathModel(
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
    required this.nameCourse,
    required this.coursePath,
  });

  int id;
  String nameCourse;
  String coursePath;

  factory LearningPath.fromJson(Map<String, dynamic> json) => LearningPath(
    id: json["id"],
    nameCourse: json["name_course"],
    coursePath: json["course_path"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_course": nameCourse,
    "course_path": coursePath,
  };
}
