
import 'package:dartz/dartz.dart';
import 'package:lost_n_found/core/error/failures.dart';
import 'package:lost_n_found/features/batch/domain/entities/batch_entity.dart';

//100 abstraction so what the domain says to do ,the data layer has to follow the order 

abstract interface class Ibatchrepository {
  Future<Either<Failures,List<BatchEntity>>> getAllBatches();
  Future<Either<Failures,BatchEntity>> getBatchById(String batchid);
  Future<Either<Failures,bool>> createBatch(BatchEntity entity);
  Future<Either<Failures,bool>> updateBatch(BatchEntity entity);
  Future<Either<Failures,bool>> deleteBatch(String batchId);

}