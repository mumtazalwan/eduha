import 'package:eduha/model/course_learning.dart';
import 'package:eduha/model/daily_quizz.dart';
import 'package:eduha/model/detail_course.dart';
import 'package:eduha/model/learning_path.dart';
import 'package:eduha/model/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final baseUrl = 'https://eduha2.000webhostapp.com/api/';

  Future getLearningPath() async {
    const endPoint = 'learning-path';
    final url = '$baseUrl$endPoint';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return learningPathModelFromJson(response.body);
      } else {
        throw 'Failed to fetch data from API';
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future getCourseLearning(int id) async {
    String endPoint = 'learning-path/foundation?idCourse=$id';
    final url = '$baseUrl$endPoint';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return courseLearningModelFromJson(response.body);
      } else {
        throw 'Failed to fetch data from API';
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future getDetailCourse(int id) async {
    String endPoint = 'learning-path/foundation/material?submaterialId=$id';
    final url = '$baseUrl$endPoint';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return detailCourseModelFromJson(response.body);
      } else {
        throw 'Failed to fetch data from API';
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future getMaterial(int id) async {
    String endPoint = 'learning-path/foundation/material/detail?materialsCode=$id';
    final url = '$baseUrl$endPoint';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return materialModelFromJson(response.body);
      } else {
        throw 'Failed to fetch data from API';
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future getCourseLearning2() async {
    String endPoint = 'learning-path/foundation?idCourse=111';
    final url = '$baseUrl$endPoint';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return courseLearningModelFromJson(response.body);
      } else {
        throw 'Failed to fetch data from API';
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future getDailyQuizz() async {
    const endPoint = 'today-chalange';
    final url = '$baseUrl$endPoint';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return dailyQuizzModelFromJson(response.body);
      } else {
        throw 'Failed to fetch data from API';
      }
    } catch (e) {
      print(e.toString());
    }
  }
}