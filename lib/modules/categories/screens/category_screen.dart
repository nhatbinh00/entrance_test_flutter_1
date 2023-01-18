import 'dart:io';

import 'package:core/common/constants/colors.dart';
import 'package:core/common/constants/constant.dart';
import 'package:core/common/constants/styles.dart';
import 'package:core/widgets/toast/toast_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:core/common/constants/colors_linear_gradient.dart';
import '../../../app/dependency_injection/get_it.dart';
import '../controller/category_controller.dart';
import '../dtos/responses/category_response.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final CategoryController categoryController =
      Get.put(getIt<CategoryController>());
  @override
  void initState() {
    super.initState();
    categoryController.getCategory(context);
  }

  Widget _buildItem([Category? category]) => GestureDetector(
        onTap: () {
          if (category != null && category.id != null) {
            categoryController.onSelect(category.id!);
          }
        },
        child: Obx(
          () => Container(
            decoration: BoxDecoration(
              color: categoryController.selection.contains(category?.id)
                  ? null
                  : Colors.transparent,
              border: Border.all(
                color: AppColors.black2,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
              gradient: categoryController.selection.contains(category?.id)
                  ? const LinearGradient(
                      colors: AppGradientColors.buttonPrimary,
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    )
                  : null,
            ),
            child: Center(
              child: Text(
                category?.name ?? Constant.empty,
                style: AppStyles.subtitle1
                    .copyWith(color: Colors.white, fontSize: 13.sp),
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            exit(0);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        actions: [
         Obx(() =>  Visibility(
           visible: categoryController.selection.isNotEmpty,
           child: Padding(
             padding: EdgeInsets.only(top: 18.h, right: 8.w),
             child: GestureDetector(
               onTap: (){
                 categoryController.saveSelection();
                 ToastCustom(context).showSuccess('TODO: Go to HomeScreen!');
               },
               child: Text(
                 'Done',
                 style: AppStyles.subtitle1.copyWith(
                   color: Colors.white,
                 ),
               ),
             ),
           ),
         ))
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
            width: 1.sw,
            child: Image.asset(
              'assets/images/category_img.jpg',
              fit: BoxFit.fitWidth,
            ),
          ),
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
                end: Alignment(0.0, 0.0),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  width: 1.sw,
                  height: 192.h,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Wellcome to Flutter Test',
                        style: AppStyles.subtitle1
                            .copyWith(color: Colors.white, fontSize: 22.sp),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 11.h, bottom: 20.h),
                        child: Text(
                          'Please select categories what you would like to see on your feed. You can set this later on Filter.',
                          style: AppStyles.subtitle1.copyWith(
                            color: Colors.white.withOpacity(0.82),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Obx(
                            () => categoryController.categories.value != null
                                ? CustomScrollView(
                                    primary: false,
                                    slivers: <Widget>[
                                      SliverGrid.count(
                                        crossAxisSpacing: 8.w,
                                        mainAxisSpacing: 8.h,
                                        crossAxisCount: 3,
                                        childAspectRatio: 1.5,
                                        children: categoryController
                                                .categories.value.categories
                                                ?.map((category) =>
                                                    _buildItem(category))
                                                .toList() ??
                                            [],
                                      ),
                                    ],
                                  )
                                : Container()),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
