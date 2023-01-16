import 'package:core/common/constants/colors.dart';
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
  bool isChecked = false;
  bool _obscureText = true;
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
              ),
            ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
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
                    showSuffixIcon: true,
                    showPrefixIcon: false,
                    backgroundColor: Colors.transparent,
                    hint: 'Your password',
                    isSecure: _obscureText,
                    style: AppStyles.body2.copyWith(
                      color: Colors.white,
                      fontSize: 15.sp,
                    ),
                    suffixIcon: IconButton(
                        icon: Icon(
                            _obscureText
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: AppColors.primary),
                        iconSize: 22.w,
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50.h),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isChecked = !isChecked;
                            });
                          },
                          child: Container(
                            width: 23.w,
                            height: 23.w,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border:
                              Border.all(color: AppColors.primary, width: 1),
                              borderRadius:
                              BorderRadius.all(Radius.circular(8.r)),
                            ),
                            child: isChecked
                                ? const Icon(
                              Icons.check,
                              color: Colors.white,
                            )
                                : null,
                          ),
                        ),
                        const SizedBox(
                          width: 9,
                        ),
                        Text(
                          'I am over 16 years of age',
                          style:
                          AppStyles.subtitle1.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50.h),
                    child: RichText(
                      text: TextSpan(
                        text:
                        'By clicking Sign Up, you are indicating that you have read and agree to the ',
                        children: [
                          TextSpan(
                            text: 'Terms of Service ',
                            style: AppStyles.body1
                                .copyWith(color: AppColors.primary),
                          ),
                          const TextSpan(
                            text: 'and ',
                          ),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: AppStyles.body1
                                .copyWith(color: AppColors.primary),
                          ),
                        ],
                        style: AppStyles.body1.copyWith(color: AppColors.black3),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.h, bottom: 60.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sign Up',
                          style: AppStyles.headline7.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          width: 54.w,
                          height: 54.w,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primary),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_forward,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
