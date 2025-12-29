import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lost_n_found/core/error/failures.dart';
import 'package:lost_n_found/features/batch/domain/usecases/create_batch_usecase.dart';
import 'package:lost_n_found/features/batch/domain/usecases/get_all_batch_usecase.dart';
import 'package:lost_n_found/features/batch/domain/usecases/update_batch_usecase.dart';
import 'package:lost_n_found/features/batch/presentation/state/batch_state.dart';

final batchViewModelProvider = NotifierProvider<BatchViewModel,BatchState>(() {

  return BatchViewModel();
  
});
class BatchViewModel extends Notifier<BatchState>{
  late final GetAllBatchUsecase _getAllBatchUsecase;
  late final UpdateBatchUsecase _updateBatchUsecase;
  late final CreateBatchUsecase _createBatchUsecase;

  @override
  BatchState build() {
    //initialization
    _getAllBatchUsecase = ref.read(getAllBatchUseCaseProvider);
    _updateBatchUsecase = ref.read(updateBatchUseCaseProvider);
    _createBatchUsecase = ref.read(createBatchUseCaseProvider);
    return BatchState();

  }
  Future<void> getAllBatches()async{
    
    state =state.copyWith(
      status: BatchStatus.loading,
    );
   await Future.delayed(Duration(seconds: 2));

    final result = await _getAllBatchUsecase();
    result.fold((left){
       state= state.copyWith(
        status: BatchStatus.error,
        errorMessage: left.message
      );

    },(batches){
        state =state.copyWith(
          status: BatchStatus.loaded,
          batches: batches
        );
    }, );


  }

  Future<void> createBatch(String batchName)async{
    //progress bar 
    state = state.copyWith(status: BatchStatus.loading);
    final params = CreateBatchUsecaseParams(batchName: batchName);
    final result = await _createBatchUsecase(params);

    result.fold((left){
       state= state.copyWith(
        status: BatchStatus.error,
        errorMessage: left.message
      );
    }, (right){
       state =state.copyWith(
        status: BatchStatus.loaded,

      );
    });
  }
}