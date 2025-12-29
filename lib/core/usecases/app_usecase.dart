
import 'package:dartz/dartz.dart';
import 'package:lost_n_found/core/error/failures.dart';
import 'package:lost_n_found/features/batch/domain/entities/batch_entity.dart';

abstract interface class UsecaseWithParams<SuccessType,Params> {

    Future<Either<Failures,bool>> call(Params  params );

}

abstract interface class UsecaseWithoutParams<SuccessType>{
    Future<Either<Failures,List<BatchEntity>>> call();

}