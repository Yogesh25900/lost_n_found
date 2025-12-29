// params 

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lost_n_found/core/error/failures.dart';
import 'package:lost_n_found/core/usecases/app_usecase.dart';
import 'package:lost_n_found/features/batch/data/repositories/batch_repository.dart';
import 'package:lost_n_found/features/batch/domain/entities/batch_entity.dart';
import 'package:lost_n_found/features/batch/domain/repositories/IBatchRepository.dart';


final createBatchUseCaseProvider = Provider<CreateBatchUsecase>((ref) {
  return CreateBatchUsecase(batchRepository: ref.read(batchRepositoryProvider));
  
}); 
class CreateBatchUsecaseParams extends Equatable {
  final String batchName;

  CreateBatchUsecaseParams({required this.batchName});
  @override
  // TODO: implement props
  List<Object?> get props => [batchName];
}

//usecase

class CreateBatchUsecase implements UsecaseWithParams<bool,CreateBatchUsecaseParams>{
  final Ibatchrepository _ibatchrepository;

  CreateBatchUsecase({required Ibatchrepository batchRepository}):_ibatchrepository = batchRepository;
  @override
  Future<Either<Failures, bool>> call(params) {

    BatchEntity batchEntity = BatchEntity(batchName:params.batchName);
    return _ibatchrepository.createBatch(batchEntity);
  }
}