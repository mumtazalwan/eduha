// To parse this JSON data, do
//
//     final courseLearningModel = courseLearningModelFromJson(jsonString);

import 'dart:convert';

CourseLearningModel courseLearningModelFromJson(String str) => CourseLearningModel.fromJson(json.decode(str));

String courseLearningModelToJson(CourseLearningModel data) => json.encode(data.toJson());

class CourseLearningModel {
  CourseLearningModel({
    required this.status,
    required this.message,
    required this.courseFoundation,
  });

  String status;
  String message;
  List<CourseFoundation> courseFoundation;

  factory CourseLearningModel.fromJson(Map<String, dynamic> json) => CourseLearningModel(
    status: json["status"],
    message: json["message"],
    courseFoundation: List<CourseFoundation>.from(json["course_foundation"].map((x) => CourseFoundation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "course_foundation": List<dynamic>.from(courseFoundation.map((x) => x.toJson())),
  };
}

class CourseFoundation {
  CourseFoundation({
    required this.materialId,
    required this.coursePath,
    required this.idCourse,
    required this.foundationName,
    required this.description,
    required this.totalLength,
  });

  int materialId;
  String coursePath;
  int idCourse;
  String foundationName;
  String description;
  int totalLength;

  factory CourseFoundation.fromJson(Map<String, dynamic> json) => CourseFoundation(
    materialId: json["material_id"],
    coursePath: json["course_path"],
    idCourse: json["id_course"],
    foundationName: json["foundation_name"],
    description: json["description"],
    totalLength: json["total_length"],
  );

  Map<String, dynamic> toJson() => {
    "material_id": materialId,
    "course_path": coursePath,
    "id_course": idCourse,
    "foundation_name": foundationName,
    "description": description,
    "total_length": totalLength,
  };
}
