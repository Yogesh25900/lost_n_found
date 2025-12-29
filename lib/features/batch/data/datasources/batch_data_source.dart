import 'package:lost_n_found/features/batch/data/models/batch_hive_model.dart';
import 'package:lost_n_found/features/batch/domain/entities/batch_entity.dart';

abstract  interface class IBatchDataSource {
  Future<List<BatchHiveModel>> getAllBatches();
  Future<BatchEntity> getBatchById(String batchid);
  Future<bool> createBatch(BatchHiveModel model);
  Future<bool> updateBatch(BatchHiveModel model);
  Future<bool> deleteBatch(String batchId);

}