import 'package:dartz/dartz.dart';
import 'package:lost_n_found/core/error/failures.dart';
import 'package:lost_n_found/features/batch/data/datasources/batch_data_source.dart';
import 'package:lost_n_found/features/batch/data/models/batch_hive_model.dart';
import 'package:lost_n_found/features/batch/domain/entities/batch_entity.dart';
import 'package:lost_n_found/features/batch/domain/repositories/IBatchRepository.dart';

class BatchRepository implements Ibatchrepository {
  final IBatchDataSource  _dataSource;

  BatchRepository({
    required IBatchDataSource dataSource
  }): _dataSource =dataSource;
  
  get batch => null;

  @override
  Future<Either<Failures, bool>> createBranch(BatchEntity batch)async {
    try{
      final model = BatchHiveModel.fromEntity(batch);
      final result = await _dataSource.createBatch(model);

      if(result){
        return const  Right(true);
      }
      return const  Left(LocalDatabaseFailure(message: "Failed to create batch"));
      
    }catch(e){
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failures, bool>> deleteBatch(String batchId ) async {
      try{
        final model = BatchHiveModel.fromEntity(batch);
      final result = await _dataSource.deleteBatch(model);
      if(result){
        return const Right(true);
      }
      return const  Left(LocalDatabaseFailure(message: "Failed to create batch"));


      }catch(e){
       return Left(LocalDatabaseFailure(message: e.toString()));

      }
  }

  @override
  Future<Either<Failures, List<BatchEntity>>> getAllBatches() {
    // TODO: implement getAllBatches
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, BatchEntity>> getBatchById(String batchId) {
    // TODO: implement getBatchById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, BatchEntity>> update(BatchEntity batch) {
    // TODO: implement update
    throw UnimplementedError();
  }


}