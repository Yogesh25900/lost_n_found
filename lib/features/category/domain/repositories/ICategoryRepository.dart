import 'package:either_dart/either.dart';
import 'package:lost_n_found/core/error/failures.dart';
import 'package:lost_n_found/features/category/domain/entities/category_entity.dart';

abstract interface class Icategoryrepository {

  Future<Either<Failures,List<CategoryEntity>>> getAllCategory();
  Future<Either<Failures,CategoryEntity>> getCategoryById(String categoryId);
  Future<Either<Failures,CategoryEntity>> createCategory(CategoryEntity category);
  Future<Either<Failures,CategoryEntity>> updateCategory(CategoryEntity category);
  Future<Either<Failures,CategoryEntity>> deleteCategory(CategoryEntity category);

}