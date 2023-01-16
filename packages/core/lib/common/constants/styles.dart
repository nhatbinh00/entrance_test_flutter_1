import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';
import 'font_family.dart';

class AppStyles {
  //function
  static TextStyle textStyleBody1(Color color) => AppStyles.body1.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
        height: 1.5,
        color: color,
        letterSpacing: 0.5.w,
      );
  static TextStyle textStyleSubtitle1(Color color) => AppStyles.subtitle1
      .copyWith(color: color, height: 24 / 14, letterSpacing: 0.15.w);

  //variable
  static TextStyle headline2 = TextStyle(
      fontSize: 60.sp,
      fontFamily: FontFamily.sFPro,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.18,
      color: AppColors.black1);
  static TextStyle headline3 = TextStyle(
      fontSize: 48.sp,
      fontFamily: FontFamily.sFPro,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.18,
      color: AppColors.black1);
  static TextStyle headline4 = TextStyle(
      fontSize: 34.sp,
      fontFamily: FontFamily.sFPro,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.18,
      color: AppColors.black1);
  static TextStyle headline5 = TextStyle(
      fontSize: 24.sp,
      fontFamily: FontFamily.sFPro,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.18,
      color: AppColors.black1);
  static TextStyle headline6 = TextStyle(
      fontSize: 18.sp,
      fontFamily: FontFamily.sFPro,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.18,
      color: AppColors.black1);
  static TextStyle headline7 = TextStyle(
      fontSize: 16.sp,
      fontFamily: FontFamily.sFPro,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.18,
      color: AppColors.black1);
  static TextStyle headline8 = TextStyle(
      fontSize: 14.sp,
      fontFamily: FontFamily.sFPro,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.18,
      color: AppColors.black1);
  static TextStyle headline9 = TextStyle(
      fontSize: 12.sp,
      fontFamily: FontFamily.sFPro,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.18,
      color: AppColors.black1);
  static TextStyle headline10 = TextStyle(
      fontSize: 10.sp,
      fontFamily: FontFamily.sFPro,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.18,
      color: AppColors.black1);
  static TextStyle headline11 = TextStyle(
      fontSize: 13.sp,
      fontFamily: FontFamily.sFPro,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.18,
      color: AppColors.black1);

  static TextStyle subtitle1 = TextStyle(
      fontSize: 14.sp,
      fontFamily: FontFamily.sFPro,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
      color: AppColors.black3);
  static TextStyle subtitle2 = TextStyle(
      fontSize: 12.sp,
      fontFamily: FontFamily.sFPro,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.15,
      color: AppColors.black3);
  static TextStyle body1 = TextStyle(
      fontSize: 12.sp,
      fontFamily: FontFamily.sFPro,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.15,
      color: AppColors.black3);
  static TextStyle body2 = TextStyle(
      fontSize: 14.sp,
      fontFamily: FontFamily.sFPro,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.2,
      color: AppColors.whiteColor);
  static TextStyle body3 = TextStyle(
      fontSize: 16.sp,
      fontFamily: FontFamily.sFPro,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5.w,
      height: 1.5,
      color: AppColors.black1);
}

class PaddingSize {
  static double micro = 3.w;
  static double small = 8.w;
  static double normal = 16.w;
  static double big = 32.w;
  static double indicatorTab = 10.w;
  static double labelTab = 10.w;
  static double large = 60.w;
}

class TextSize {
  static double micro = 12.sp;
  static double small = 14.sp;
  static double normal = 18.sp;
  static double big = 24.sp;
}

class RadiusBorders {
  static double normal = 8.r;
}
