import 'package:eduha/common/theme_data.dart';
import 'package:eduha/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (_, child) => MaterialApp(
        title: 'Eduha',
        theme: AppThemeData.getTheme(),
        debugShowCheckedModeBanner: false,
        home: child,
      ),
      child: const Home(),
    );
  }
}
