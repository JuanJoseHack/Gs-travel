import 'package:GsTravel/src/presentation/pages/client/Orders/bloc/ClienteOrderListEvent.dart';
import 'package:GsTravel/src/presentation/pages/client/Orders/bloc/ClienteOrderListState.dart';
import 'package:bloc/bloc.dart';
import 'package:GsTravel/src/domain/useCase/Order/GetOrdersByClientUseCase.dart';
import 'package:GsTravel/src/domain/models/OrderList.dart';
import 'package:GsTravel/src/domain/utils/Resource.dart';

class ClienteOrderListBloc
    extends Bloc<ClienteOrderListEvent, ClienteOrderListState> {
  final GetOrdersByClientUseCase getOrdersByClientUseCase;

  ClienteOrderListBloc({required this.getOrdersByClientUseCase})
      : super(const ClienteOrderListState(isLoading: false));

  @override
  Stream<ClienteOrderListState> mapEventToState(
    ClienteOrderListEvent event,
  ) async* {
    if (event is LoadClienteOrders) {
      // Empezamos el estado de carga
      yield state.copyWith(isLoading: true, errorMessage: null);

      try {
        // Llamamos al caso de uso para obtener las órdenes
        Resource<List<OrderList>> response =
            await getOrdersByClientUseCase.run(event.clientId);

        // Verificamos si el resultado es un Success
        if (response is Success<List<OrderList>>) {
          yield state.copyWith(
              orders: Success(response.data), isLoading: false);
        } else if (response is Error) {
          // Si es un Error, mostramos el mensaje de error
          yield state.copyWith(
              isLoading: false, errorMessage: response.message);
        } else {
          // Si el resultado es otro tipo de Resource (por ejemplo, Initial o Loading)
          yield state.copyWith(
              isLoading: false, errorMessage: 'Unexpected error occurred');
        }
      } catch (e) {
        yield state.copyWith(
            isLoading: false, errorMessage: 'Error: ${e.toString()}');
      }
    }
  }
}
