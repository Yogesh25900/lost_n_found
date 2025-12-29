import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lost_n_found/core/services/hive/hive_service.dart';
import 'package:lost_n_found/features/batch/data/datasources/batch_data_source.dart';
import 'package:lost_n_found/features/batch/data/models/batch_hive_model.dart';
import 'package:lost_n_found/features/batch/domain/entities/batch_entity.dart';


final batchLocalDataSourceProvider = Provider<BatchLocalDataSource>((ref){
  return BatchLocalDataSource(
    hiveService: ref.read(hiveServiceProvider),
  );
});


class BatchLocalDataSource implements IBatchDataSource {
  //dependency injection
  final HiveService _hiveService;


  BatchLocalDataSource({
    required HiveService hiveService,
  }) : _hiveService = hiveService;

  @override
  Future<bool> createBatch(BatchHiveModel model) async{
   try{
     await _hiveService.createBatch(model);
     return true;
   }catch(e){
    return false;
   }
  }

  @override
  Future<bool> deleteBatch(String batchId) {
    // TODO: implement deleteBatch
    throw UnimplementedError();
  }

  @override
  Future<List<BatchHiveModel>> getAllBatches() async{
    try{
      return _hiveService.getAllBatch();

    }catch(e){
      return [];
    }
  }

  @override
  Future<BatchEntity> getBatchById(String batchid) {
    // TODO: implement getBatchById
    throw UnimplementedError();
  }

  @override
  Future<bool> updateBatch(BatchHiveModel model) {
    // TODO: implement updateBatch
    throw UnimplementedError();
  }

}
