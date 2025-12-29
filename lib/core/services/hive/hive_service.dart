import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:lost_n_found/core/constants/hive_table_constant.dart';
import 'package:lost_n_found/features/batch/data/models/batch_hive_model.dart';
import 'package:path_provider/path_provider.dart';

final hiveServiceProvider = Provider<HiveService>((ref){
  return HiveService();
});
class HiveService {
  //inti

  Future<void> init() async{
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/${HiveTableConstant.dbName}';

    Hive.init(path);
    _registerAdapter();
    await openBoxes();
    await addDummyData();
  }


//add dummy data for batches
  Future<void> addDummyData() async{
    final box = await Hive.openBox<BatchHiveModel>(HiveTableConstant.batchTable);
    if(box.isNotEmpty){
      return;
    }

    final dummyBatches = [
      BatchHiveModel( batchName: 'Batch 1'),
      BatchHiveModel( batchName: 'Batch 2'),
      BatchHiveModel( batchName: 'Batch 3'),
    ];

    for(var batch in dummyBatches){
      await box.put(batch.batchId, batch);
    }

    await box.close();
  }

  //register adapter 

  void _registerAdapter(){
    if(!Hive.isAdapterRegistered(HiveTableConstant.batchTypeId)){
      Hive.registerAdapter(BatchHiveModelAdapter());


    }

  }

  //openboxes 


  Future<void> openBoxes() async{
    await Hive.openBox<BatchHiveModel>(HiveTableConstant.batchTable);

  }


  //close boxed 
    Future<void> closeBox() async{
    await Hive.close();

  }


  //query
  Box<BatchHiveModel> get _batchBox => Hive.box<BatchHiveModel>(HiveTableConstant.batchTable);

  //CRUD we need here 

  Future<BatchHiveModel> createBatch(BatchHiveModel model) async{
    await _batchBox.put(model.batchId,model);
    return model;
  }
  


  List<BatchHiveModel> getAllBatch() {
    
    return _batchBox.values.toList();

  }

  Future<void> updateBatch(BatchHiveModel model) async{
    await _batchBox.put(model.batchId,model);
  }
  
  
}