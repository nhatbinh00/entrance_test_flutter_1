import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:core/common/constants/strings.dart';
import '../dtos/responses/category_response.dart';
import 'package:flutter_entrance_test/modules/categories/route.dart';

part 'rest_service.g.dart';

@lazySingleton
@RestApi()
abstract class CategoryService {
  @factoryMethod
  factory CategoryService(Dio dio) = _CategoryService;

  @GET(RouteApi.getCategory)
  Future<CategoryResponse> getCategory(
      @Query(Strings.pageNumber) int pageNumber,
      @Query(Strings.pageSize) int pageSize,
  );
}
