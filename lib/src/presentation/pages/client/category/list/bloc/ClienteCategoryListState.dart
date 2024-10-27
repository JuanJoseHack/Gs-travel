import 'package:ecommerce_v2/src/domain/utils/Resource.dart';
import 'package:equatable/equatable.dart';

class ClienteCategoryListState extends Equatable {
  final Resource? response;

  const ClienteCategoryListState({this.response});

  ClienteCategoryListState copyWith({Resource? response}) {
    return ClienteCategoryListState(response: response);
  }

  @override
  List<Object?> get props => [response];
}
