import 'package:hive/hive.dart';
import 'package:lost_n_found/core/constants/hive_table_constant.dart';
import 'package:lost_n_found/features/batch/domain/entities/batch_entity.dart';
import 'package:uuid/uuid.dart';


//box 
//adapter : binary lai object ma convert grne as local data is stored in binart form
part 'batch_hive_model.g.dart';
//dart run build_runner build -d
@HiveType(typeId: HiveTableConstant.batchTypeId)
class BatchHiveModel extends HiveObject{

@HiveField(0)
  final String? batchId;
  @HiveField(1)

  final String batchName;
  @HiveField(2)

  final String? status;

  //constructor for the fields

  BatchHiveModel({
    String? batchId,
    required this.batchName,
    String? status
  }):batchId =batchId ?? Uuid().v4(), status = status ?? "active";

  //toEntity 
  BatchEntity toEntity(){
    return BatchEntity(
      batchId: batchId,
      batchName: batchName,
      status: status );

    
  }


  //fromEntity

  factory BatchHiveModel.fromEntity(BatchEntity entity){
    return BatchHiveModel(batchName: entity.batchName);
  }


  //toEntityList

  static List<BatchEntity> toEntityList(List<BatchHiveModel> models){
    return models.map((model) => model.toEntity()).toList();
  }




}