import 'package:hive/hive.dart';
import 'package:lost_n_found/core/constants/hive_table_constant.dart';
import 'package:lost_n_found/features/batch/data/models/batch_hive_model.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  Future<void> init() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/${HiveTableConstant.dbName}';

    Hive.init(path);

    _registerAdapters();
    await _openBoxes();
  }

  Box<BatchHiveModel> get _batchBox =>
      Hive.box<BatchHiveModel>(HiveTableConstant.batchTable);

  Future<void> createBatch(BatchHiveModel batch) async {
    await _batchBox.put(batch.batchId, batch);
  }

  Future<void> deleteBatch(String batchId) async {
    await _batchBox.delete(batchId);
  }

  Future<List<BatchHiveModel>> getAllBatches() async {
    return _batchBox.values.toList();
  }

  Future<BatchHiveModel?> getBatchById(String batchId) async {
    return _batchBox.get(batchId);
  }

  Future<void> updateBatch(BatchHiveModel batch) async {
    await _batchBox.put(batch.batchId, batch);
  }
}

Future<void> _openBoxes() async {
  await Hive.openBox<BatchHiveModel>(HiveTableConstant.batchTable);
}

void _registerAdapters() {
  if (!Hive.isAdapterRegistered(HiveTableConstant.batchTypeId)) {
    Hive.registerAdapter(BatchHiveModelAdapter());
  }
}
