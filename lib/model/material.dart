// To parse this JSON data, do
//
//     final materialModel = materialModelFromJson(jsonString);

import 'dart:convert';

MaterialModel materialModelFromJson(String str) => MaterialModel.fromJson(json.decode(str));

String materialModelToJson(MaterialModel data) => json.encode(data.toJson());

class MaterialModel {
  MaterialModel({
    required this.status,
    required this.message,
    required this.courseFoundation,
  });

  String status;
  String message;
  List<CourseFoundation> courseFoundation;

  factory MaterialModel.fromJson(Map<String, dynamic> json) => MaterialModel(
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
    required this.id,
    required this.material,
    required this.image,
    required this.explanation,
    required this.codeMaterial,
  });

  int id;
  String material;
  String image;
  String explanation;
  int codeMaterial;

  factory CourseFoundation.fromJson(Map<String, dynamic> json) => CourseFoundation(
    id: json["id"],
    material: json["material"],
    image: json["image"],
    explanation: json["explanation"],
    codeMaterial: json["code_material"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "material": material,
    "image": image,
    "explanation": explanation,
    "code_material": codeMaterial,
  };
}
