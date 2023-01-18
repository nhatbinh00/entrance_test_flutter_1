import 'package:core/common/constants/colors.dart';
import 'package:core/common/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
enum LevelPw { Unknown, Weak, Fair, Good, Strong, Short, Long }

extension WithLevelPw on LevelPw {
  Widget toLevelWidget() {
    switch (this) {
      case LevelPw.Unknown:
        return  Container(
          height: 2,
          width: 1.sw,
          color: AppColors.primary,
        );
      case LevelPw.Weak:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const LinearProgressIndicator(
              color: Colors.red,
              backgroundColor: AppColors.black4,
              value: 0.2,
            ),
            SizedBox(height: 5.h,),
            Text(
              'Weak',
              style: AppStyles.subtitle2.copyWith(
                color: Colors.red,
              ),
            )
          ],
        );
      case LevelPw.Fair:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const LinearProgressIndicator(
              color: Colors.amber,
              backgroundColor: AppColors.black4,
              value: 0.4,
            ),
            SizedBox(height: 5.h,),
            Text(
              'Fair',
              style: AppStyles.subtitle2.copyWith(
                color: Colors.amber,
              ),
            )
          ],
        );
      case LevelPw.Good:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children:  [
            const LinearProgressIndicator(
              color: AppColors.primary,
              backgroundColor: AppColors.black4,
              value: 0.8,
            ),
            SizedBox(height: 5.h,),
            Text('Good',style: AppStyles.subtitle2.copyWith(
              color: AppColors.primary,
            ),)
          ],
        );
      case LevelPw.Strong:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            LinearProgressIndicator(
              color: Colors.green.shade400,
              backgroundColor: AppColors.black4,
              value: 1,
            ),
            SizedBox(height: 5.h,),
            Text('Strong',style: AppStyles.subtitle2.copyWith(
              color: Colors.green.shade400,
            ),)
          ],
        );
      case LevelPw.Short:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children:  [
            const LinearProgressIndicator(
              color: AppColors.black4,
              backgroundColor: AppColors.black4,
              value: 0,
            ),
            SizedBox(height: 5.h,),
            Text('Too Short',style: AppStyles.subtitle2.copyWith(
              color: AppColors.black4,
            ),)
          ],
        );
      case LevelPw.Long:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children:  [
            const LinearProgressIndicator(
              color: AppColors.black4,
              backgroundColor: AppColors.black4,
              value: 0,
            ),
            SizedBox(height: 5.h,),
            Text('Too Long',style: AppStyles.subtitle2.copyWith(
              color: AppColors.black4,
            ),)
          ],
        );
    }
  }
}
