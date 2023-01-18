import 'package:core/utilities/data/network_gen/error_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:core/utilities/data/network_gen/failure.dart';
import 'package:injectable/injectable.dart';
import '../dtos/responses/category_response.dart';
import '../services/rest_service.dart';

abstract class CategoryRepository {
  Future<Either<Failure, CategoryResponse>> getCategory(
    int pageNumber,
    int pageSize,
  );
}

@LazySingleton(as: CategoryRepository)
class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryService _categoryService;

  CategoryRepositoryImpl(this._categoryService);

  @override
  Future<Either<Failure, CategoryResponse>> getCategory(
    int pageNumber,
    int pageSize,
  ) async {
    try {
      final CategoryResponse response =
          await _categoryService.getCategory(pageNumber, pageSize);
      return Right(response);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
