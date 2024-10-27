import 'package:ecommerce_v2/src/domain/utils/Resource.dart';
import 'package:equatable/equatable.dart';

class ClienteProductListState extends Equatable {
  final Resource? response;

  const ClienteProductListState({this.response});

  ClienteProductListState copyWith({Resource? response}) {
    return ClienteProductListState(response: response);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [response];
}
