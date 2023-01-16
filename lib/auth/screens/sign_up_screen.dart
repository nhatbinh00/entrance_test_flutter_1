import 'package:core/common/constants/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:core/widgets/text_field/text_field_custom.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          Image.asset('assets/images/img_sign_up.jpg'),
          Container(
            width: 1.sw,
            height: 1.sh,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.black,
              ],
              begin: Alignment(0.0, -1.0),
              end: Alignment(0.0, 0.5),
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Let’s get you started!",
                  style: GoogleFonts.lato(
                    fontStyle: FontStyle.normal,
                    color: Colors.white,
                    fontSize: 22.sp,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFieldCustom(
                    showSuffixIcon: false,
                    showPrefixIcon: false,
                    backgroundColor: Colors.transparent,
                    hint: 'Your email',
                    style: AppStyles.body2.copyWith(
                      color: Colors.white,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
                TextFieldCustom(
                  showSuffixIcon: false,
                  showPrefixIcon: false,
                  backgroundColor: Colors.transparent,
                  hint: 'Your email',
                  style: AppStyles.body2.copyWith(
                    color: Colors.white,
                    fontSize: 15.sp,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
