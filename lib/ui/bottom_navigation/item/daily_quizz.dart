import 'package:eduha/model/daily_quizz.dart';
import 'package:eduha/service/api-service.dart';
import 'package:eduha/ui/detail_quizz/detail_quizz.dart';
import 'package:eduha/ui/widget/item_daily_quizz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class DailyQuizz extends StatefulWidget {
  const DailyQuizz({Key? key}) : super(key: key);

  @override
  State<DailyQuizz> createState() => _DailyQuizzState();
}

class _DailyQuizzState extends State<DailyQuizz> {
  DailyQuizzModel? dailyQuizzModel;
  bool _isLoad = false;

  Future getApi() async {
    dailyQuizzModel = await ApiService().getDailyQuizz();
    if (mounted) {
      setState(() {
        _isLoad = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getApi();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoad
        ? Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text('Daily Chalenge',
                  style: GoogleFonts.inter(fontSize: 16)),
            ),
            backgroundColor: Colors.grey.withOpacity(0.2),
            body: ListView.builder(
                itemCount: dailyQuizzModel?.data.length,
                itemBuilder: (_, index) {
                  var quizz_list = dailyQuizzModel!.data[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailQuizz(data: dailyQuizzModel!.data[index],)));
                    },
                    child: DailyQuizzCard(
                      course_name: quizz_list.courseName,
                      quiz_name: quizz_list.quizName,
                      mini_description: quizz_list.miniDescription,
                      img_path: quizz_list.quizPath,
                    ),
                  );
                }),
          )
        : Center(
            child:
                Lottie.asset('assets/lottie/cubes_loader.json', height: 200.h),
          );
  }
}
