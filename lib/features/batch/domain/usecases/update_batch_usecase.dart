import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lost_n_found/core/error/failures.dart';
import 'package:lost_n_found/core/usecases/app_usecase.dart';
import 'package:lost_n_found/features/batch/data/repositories/batch_repository.dart';
import 'package:lost_n_found/features/batch/domain/entities/batch_entity.dart';
import 'package:lost_n_found/features/batch/domain/repositories/IBatchRepository.dart';

class UpdateBatchUsecaseParams extends Equatable {
  final String batchId;
  final String batchName;
  final String? status;

  UpdateBatchUsecaseParams({
    required this.batchId,
    required this.batchName,
    this.status
  });
  @override
   List<Object?> get props => [batchId,batchName,status];
}



final updateBatchUseCaseProvider = Provider<UpdateBatchUsecase>((ref) {
  return UpdateBatchUsecase(batchRepository: ref.read(batchRepositoryProvider));
  
});
class UpdateBatchUsecase  implements UsecaseWithParams<bool,UpdateBatchUsecaseParams>{
  final Ibatchrepository _ibatchrepository;

  UpdateBatchUsecase({required Ibatchrepository batchRepository}):_ibatchrepository = batchRepository;  @override
  Future<Either<Failures, bool>> call(UpdateBatchUsecaseParams params) {
    BatchEntity batchEntity = BatchEntity(batchName: params.batchName,
    status: params.status,
    batchId: params.batchId
    );

    return _ibatchrepository.updateBatch(batchEntity);
  }
}