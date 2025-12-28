import 'package:equatable/equatable.dart';

class BatchEntity extends Equatable {
  // while adding we dont need the batchid ,only we need batchname
  final String? batchId;
  final String batchName;
  final String? status;


  const BatchEntity({
    this.batchId,
    required this.batchName,
    required this.status
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

