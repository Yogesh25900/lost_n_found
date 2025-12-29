
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lost_n_found/core/error/failures.dart';
import 'package:lost_n_found/features/batch/data/datasources/batch_data_source.dart';
import 'package:lost_n_found/features/batch/data/datasources/local/batch_local_data_source.dart';
import 'package:lost_n_found/features/batch/data/models/batch_hive_model.dart';
import 'package:lost_n_found/features/batch/domain/entities/batch_entity.dart';
import 'package:lost_n_found/features/batch/domain/repositories/IBatchRepository.dart';


final batchRepositoryProvider = Provider<Ibatchrepository>((ref){
  return BatchRepository(
    datasource: ref.read(batchLocalDataSourceProvider),
  );
});
class BatchRepository implements Ibatchrepository{
  final IBatchDataSource _dataSource;

  BatchRepository({
    required IBatchDataSource datasource
  }):_dataSource = datasource;



  @override
  Future<Either<Failures, bool>> createBatch(BatchEntity entity)async {
    try{
        //entitty lai model ma convert grne
        final model = BatchHiveModel.fromEntity(entity);
        final result = await _dataSource.createBatch(model);
        if(result){
           return Right(result);

        }
        return Left(LocalDatabaseFailure(message:"Failed to create batch"));

    }catch(e){
      return Left(LocalDatabaseFailure(message: e.toString()));

    }
  }

  @override
  Future<Either<Failures, bool>> deleteBatch(String batchId) {
    // TODO: implement deleteBatch
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, List<BatchEntity>>> getAllBatches()async {
    try{
      final lst = await _dataSource.getAllBatches();
      final entities = BatchHiveModel.toEntityList(lst);
      
      return Right(entities);
    

    }catch(e){
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failures, BatchEntity>> getBatchById(String batchid) {
    // TODO: implement getBatchById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, bool>> updateBatch(BatchEntity entity) {
    // TODO: implement updateBatch
    throw UnimplementedError();
  }
}