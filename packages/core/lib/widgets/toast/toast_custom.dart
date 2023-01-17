import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../common/constants/colors.dart';
import '../../common/constants/styles.dart';

class ToastCustom {
  final BuildContext ctx;
  final int timeSecondDuration;
  FToast fToast = FToast();

  ToastCustom(this.ctx, {this.timeSecondDuration = 3}) {
    fToast.init(ctx);
  }

  errorWidget(String message) {
    return Container(
        // padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.0.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: AppColors.negative4,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Icon(
            //   Icons.notification_important,
            //   color: Colors.white,
            //   size: 15.w,
            // ),
            SizedBox(width: 10.w),
            Flexible(
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: AppStyles.body3.copyWith(
                    color: AppColors.secondary,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400),
              ),
            ),
            IconButton(
              onPressed: () {
                fToast.removeCustomToast();
              },
              icon: Icon(
                Icons.close,
                color: AppColors.secondary,
                size: 15.w,
              ),
            )
          ],
        ));
  }

  successWidget(String message) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.0.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Colors.green.shade300,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check,
            color: Colors.white,
            size: 15.w,
          ),
          SizedBox(width: 10.w),
          Flexible(
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: AppStyles.body3.copyWith(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400),
            ),
          ),
          IconButton(
            onPressed: () {
              fToast.removeCustomToast();
            },
            icon: Icon(
              Icons.close,
              color: Colors.white,
              size: 15.w,
            ),
          )
        ],
      ),
    );
  }

  void showError(String msg, {ToastGravity? positon}) {
    fToast.removeQueuedCustomToasts();
    fToast.showToast(
      child: errorWidget(msg),
      gravity: positon ?? ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: timeSecondDuration),
    );
  }

  void showSuccess(String msg, {ToastGravity? position}) {
    fToast.removeQueuedCustomToasts();
    fToast.showToast(
      child: successWidget(msg),
      gravity: position ?? ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: timeSecondDuration),
    );
  }
}
