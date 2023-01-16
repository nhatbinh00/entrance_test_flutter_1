import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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
  static TextStyle headline2 = GoogleFonts.lato(
      fontSize: 60.sp,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.18,
      color: AppColors.black1);
  static TextStyle headline3 = GoogleFonts.lato(
      fontSize: 48.sp,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.18,
      color: AppColors.black1);
  static TextStyle headline4 = GoogleFonts.lato(
      fontSize: 34.sp,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.18,
      color: AppColors.black1);
  static TextStyle headline5 = GoogleFonts.lato(
      fontSize: 24.sp,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.18,
      color: AppColors.black1);
  static TextStyle headline6 = GoogleFonts.lato(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.18,
      color: AppColors.black1);
  static TextStyle headline7 = GoogleFonts.lato(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.18,
      color: AppColors.black1);
  static TextStyle headline8 = GoogleFonts.lato(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.18,
      color: AppColors.black1);
  static TextStyle headline9 = GoogleFonts.lato(
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.18,
      color: AppColors.black1);
  static TextStyle headline10 = GoogleFonts.lato(
      fontSize: 10.sp,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.18,
      color: AppColors.black1);
  static TextStyle headline11 = GoogleFonts.lato(
      fontSize: 13.sp,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.18,
      color: AppColors.black1);

  static TextStyle subtitle1 = GoogleFonts.lato(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
      color: AppColors.black3);
  static TextStyle subtitle2 = GoogleFonts.lato(
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.15,
      color: AppColors.black3);
  static TextStyle body1 = GoogleFonts.lato(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      color: AppColors.black3);
  static TextStyle body2 = GoogleFonts.lato(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.2,
      color: AppColors.whiteColor);
  static TextStyle body3 = GoogleFonts.lato(
      fontSize: 16.sp,
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
