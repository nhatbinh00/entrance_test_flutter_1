import 'package:injectable/injectable.dart';

import 'package:core/utilities/data/network_gen/error_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:core/utilities/data/network_gen/failure.dart';

import '../dtos/responses/category_response.dart';
import '../repositories/category_repository.dart';

@LazySingleton()
class CategoryUseCase {
  final CategoryRepository _categoryRepository;
  CategoryUseCase(this._categoryRepository);

  Future<Either<Failure, CategoryResponse>> getCategory(
      int pageNumber,
      int pageSize,
  ) async {
    return await _categoryRepository.getCategory(pageNumber,pageSize);
  }
}
