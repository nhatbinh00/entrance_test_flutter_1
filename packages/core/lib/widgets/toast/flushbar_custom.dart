// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_flushbar/flutter_flushbar.dart';
// import '../../common/constants/colors.dart';
//
//
// class ShowToast {
//   final BuildContext ctx;
//
//   final timeDuration;
//   ShowToast(this.ctx, {this.timeDuration = 4});
//
//   void showFlushbar(String msg,
//       {int position = 0, Color? backgroundColor, IconData? success, int? time}) {
//     Flushbar(
//       backgroundColor: backgroundColor ?? Colors.red,
//       icon: Icon(
//         success ?? Icons.notification_important,
//         color: AppColors.whiteColor,
//       ),
//       title: "Thông báo",
//       messageText: Text(
//         msg,
//         style: TextStyle(color: Colors.white),
//       ),
//       duration: Duration(seconds: time ?? timeDuration),
//       flushbarPosition:
//       position == 0 ? FlushbarPosition.BOTTOM : FlushbarPosition.TOP,
//     )..show(ctx);
//   }
// }
