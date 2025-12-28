
import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String? categoryId;
  final String categoryName;
  final String? status;

  const CategoryEntity({
    this.categoryId,
    required this.categoryName,
    required this.status,
  });


  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
  
  }