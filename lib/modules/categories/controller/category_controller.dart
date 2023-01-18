import 'package:core/common/constants/constant.dart';
import 'package:core/utilities/data/network_gen/failure.dart';
import 'package:core/utilities/global/app_loading.dart';
import 'package:core/utilities/global/app_shared.dart';
import 'package:core/widgets/toast/toast_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../app/dependency_injection/get_it.dart';
import 'package:injectable/injectable.dart';
import '../dtos/responses/category_response.dart';
import '../use_case/category_usecase.dart';

@LazySingleton()
class CategoryController extends GetxController {
  var categories = CategoryResponse().obs;
  var selection = <String>[].obs;

  final CategoryUseCase _categoryUseCase = getIt<CategoryUseCase>();

  Future<void> getCategory(BuildContext context) async {
    ProgressHUD.show();
    await (await _categoryUseCase.getCategory(
      Constant.pageNumber,
      Constant.pageSize,
    ))
        .fold((Failure failure) async {
      ProgressHUD.dismiss();
      ToastCustom(context).showError(failure.message);
    }, (data) async {
      categories.value = data;
      // get from storage selected categories are saved
      final listSelection = AppShared.share?.getStringList(Constant.selectionCategoryKey);
      if(listSelection != null && listSelection.isNotEmpty){
        selection.clear();
        selection.addAll(listSelection);
      }

    }).whenComplete(() => ProgressHUD.dismiss());
  }

  void onSelect (String categoryId){
    final hasExist = selection.contains(categoryId);
    if(hasExist){
      selection.remove(categoryId);
    }
    else{
      selection.add(categoryId);
    }
  }

  void saveSelection(){
    AppShared.share?.setStringList(Constant.selectionCategoryKey, selection);
  }
}
