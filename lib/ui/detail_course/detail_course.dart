import 'package:eduha/common/color_values.dart';
import 'package:eduha/model/detail_course.dart';
import 'package:eduha/service/api-service.dart';
import 'package:eduha/ui/widget/item_lesson.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class DetailCourseView extends StatefulWidget {
  final int id;
  final String title, desc, img;

  const DetailCourseView(
      {Key? key,
      required this.id,
      required this.title,
      required this.desc,
      required this.img})
      : super(key: key);

  @override
  State<DetailCourseView> createState() => _DetailCourseViewState();
}

class _DetailCourseViewState extends State<DetailCourseView> {
  DetailCourseModel? _detailCourseModel;
  bool _isLoaded = false;

  Future getApi() async {
    _detailCourseModel = await ApiService().getDetailCourse(widget.id);
    setState(() {
      _isLoaded = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApi();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: _isLoaded
            ? CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.white,
                    elevation: 2,
                    pinned: true,
                    snap: false,
                    floating: false,
                    expandedHeight: 270.h,
                    automaticallyImplyLeading: false,
                    flexibleSpace: FlexibleSpaceBar(
                      titlePadding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 15.h),
                      title: Text(
                        widget.title,
                        style: theme.headline2,
                      ),
                      background: SvgPicture.asset(
                        'assets/courses/${widget.img}.svg',
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.only(top: 15.h),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Column(
                              children: [
                                Text(
                                  widget.desc,
                                  style: GoogleFonts.inter(
                                    color: Colors.grey,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.black,
                                    minimumSize: Size(double.infinity, 40.h),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    textStyle: GoogleFonts.inter(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text('CONTINUE COURSE'),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(top: 30.h, bottom: 10.h),
                            color: ColorValues.grey,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  _detailCourseModel?.courseFoundation.length,
                              itemBuilder: (_, index) {
                                var course =
                                    _detailCourseModel!.courseFoundation[index];

                                return ItemLesson(
                                  index: index,
                                  materialName: course.materialName,
                                  cTitle: course.mainTitle,
                                  cDesc: course.description,
                                  cImg: course.imgPath,
                                  exercise: _detailCourseModel!.exercise,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : Center(
                child: Lottie.asset('assets/lottie/cubes_loader.json',
                    height: 200.h),
              ),
      ),
    );
  }
}
