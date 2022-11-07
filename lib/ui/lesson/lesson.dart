import 'package:eduha/common/color_values.dart';
import 'package:eduha/model/detail_course.dart';
import 'package:eduha/model/material.dart';
import 'package:eduha/service/api-service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LessonView extends StatefulWidget {
  final int id;

  const LessonView({Key? key, required this.id}) : super(key: key);

  @override
  State<LessonView> createState() => _LessonViewState();
}

class _LessonViewState extends State<LessonView> {
  MaterialModel? _model;
  bool _isLoaded = false;
  final _controller = PageController();
  double _progress = 0;
  int _indicatorProgress = 0;

  Future _getApi() async {
    _model = await ApiService().getMaterial(widget.id);
    if (mounted) {
      setState(() {
        _isLoaded = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getApi();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 1.5,
        title: LinearPercentIndicator(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          backgroundColor: const Color(0XFFc0c0c0),
          progressColor: ColorValues.green,
          lineHeight: 7,
          percent: _progress,
          animation: true,
          animateFromLastPercent: true,
          barRadius: const Radius.circular(3),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: Row(
              children: [
                Text(
                  '1',
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Icon(
                  Icons.flash_on_outlined,
                  color: Colors.amber,
                ),
              ],
            ),
          ),
        ],
      ),
      body: _isLoaded
          ? PageView.builder(
              controller: _controller,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _model?.courseFoundation.length,
              itemBuilder: (_, index) {
                var model = _model!.courseFoundation[index];

                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.material,
                        style: theme.headline1,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        model.explanation,
                        style: theme.bodyText1,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          minimumSize: Size(50.w, 40.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: (index ==
                                _model!.courseFoundation.length - 1)
                            ? () {
                                _indicatorProgress == 0
                                    ? setState(() {
                                        _indicatorProgress += 1;
                                        _progress += 1 /
                                            _model!.courseFoundation.length
                                                .toDouble();
                                      })
                                    : Navigator.pop(context);
                              }
                            : () {
                                setState(() {
                                  _progress += 1 /
                                      _model!.courseFoundation.length
                                          .toDouble();
                                });
                                _controller.nextPage(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeInOut,
                                );
                              },
                        child: _indicatorProgress == 0
                            ? Text(
                                (index < _model!.courseFoundation.length - 1)
                                    ? 'Continue'
                                    : 'Finish',
                              )
                            : const Text('Back'),
                      ),
                    ],
                  ),
                );
              },
            )
          : Center(
              child: Lottie.asset('assets/lottie/cubes_loader.json',
                  height: 200.h),
            ),
    );
  }
}
