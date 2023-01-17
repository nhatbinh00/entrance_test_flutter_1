import 'dart:async';
import 'package:core/common/constants/colors.dart';
import 'package:core/common/constants/styles.dart';
import 'package:core/widgets/text_field/text_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_entrance_test/auth/dtos/enum/level_pw.dart';
import 'package:flutter_entrance_test/auth/screens/widgets/spacer_widget.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controller/sign_up_controller.dart';
import '../../dtos/enum/type_input.dart';

class TextFieldSignUpWidget extends StatefulWidget {
  final TypeInput typeInput;
  final String titleProp;
  const TextFieldSignUpWidget({
    Key? key,
    required this.titleProp,
    required this.typeInput,
  }) : super(key: key);

  @override
  State<TextFieldSignUpWidget> createState() => _TextFieldSignUpWidgetState();
}

class _TextFieldSignUpWidgetState extends State<TextFieldSignUpWidget> {
  bool _obscureText = true;
  final StreamController<bool> titleStream = BehaviorSubject<bool>();
  final StreamController<bool> validatePw = BehaviorSubject<bool>();
  final SignUpController signUpCtrl = Get.find();

  @override
  void initState() {
    super.initState();
    titleStream.sink.add(false);
  }

  @override
  void dispose() {
    super.dispose();
    titleStream.close();
  }

  void onComplete() {
    spacer.sink.add(false);
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void onChangeText(String text) {
    if (text.isNotEmpty) {
      titleStream.sink.add(true);
    } else {
      titleStream.sink.add(false);
    }
  }

  Widget _buildEmailInput() => TextFieldCustom(
        showSuffixIcon: false,
        showPrefixIcon: false,
        backgroundColor: Colors.transparent,
        hint: 'Your email',
        style: AppStyles.body2.copyWith(
          color: Colors.white,
          fontSize: 15.sp,
        ),
        onChanged: (email){
          onChangeText(email);
          signUpCtrl.setEmail(email);
        },
        onTap: () {
          spacer.sink.add(true);
        },
        onEditingComplete: onComplete,
      );

  Widget _buildPwInput() => Column(
        children: [
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
              },
            ),
            border: InputBorder.none,
            onChanged: (pw){
              onChangeText(pw);
              signUpCtrl.validatePw(pw);
            },
            onTap: () {
              spacer.sink.add(true);
            },
            onEditingComplete: onComplete,
          ),
          Obx(() => SizedBox(
            width: 1.sw,
            child: signUpCtrl.levelPw.value.toLevelWidget(),
          ),)
        ],
      );

  Widget _buildInput() {
    switch (widget.typeInput) {
      case TypeInput.Email:
        return _buildEmailInput();
      case TypeInput.Pw:
        return _buildPwInput();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StreamBuilder(
            stream: titleStream.stream,
            builder: (ctx, state) {
              if (state.hasData) {
                if (state.data!) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: Text(
                      widget.titleProp,
                      style: AppStyles.subtitle2.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  );
                }
                return Container();
              }
              return Container();
            }),
        _buildInput(),
      ],
    );
  }
}
