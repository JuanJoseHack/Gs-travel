import 'package:GsTravel/src/domain/useCase/products/ProductsUseCases.dart';
import 'package:GsTravel/src/domain/utils/Resource.dart';
import 'package:GsTravel/src/presentation/pages/client/product/list/bloc/ClienteProductListEvent.dart';
import 'package:GsTravel/src/presentation/pages/client/product/list/bloc/ClienteProductListState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClienteProductListBloc
    extends Bloc<ClienteProductListEvent, ClienteProductListState> {
  final ProductsUseCases productsUseCases;

  ClienteProductListBloc(this.productsUseCases)
      : super(ClienteProductListState(response: Loading())) {
    on<GetProductsByCategory>(_onGetProductsByCategory);
    on<GetAllProducts>(_onGetAllProducts);
  }

  Future<void> _onGetProductsByCategory(GetProductsByCategory event,
      Emitter<ClienteProductListState> emit) async {
    emit(state.copyWith(response: Loading())); // Estado cargando
    try {
      Resource response =
          await productsUseCases.getProductsByCategory.run(event.idCategory);
      emit(state.copyWith(response: response)); // Estado con la respuesta
    } catch (e) {
      emit(state.copyWith(
          response: Error("Error al cargar productos por categoría: $e")));
    }
  }

  Future<void> _onGetAllProducts(
      GetAllProducts event, Emitter<ClienteProductListState> emit) async {
    if (state.response is Success && (state.response as Success).data != null) {
      return; // Si ya se cargaron productos, no volver a cargarlos
    }
    emit(state.copyWith(response: Loading())); // Estado cargando
    try {
      Resource response = await productsUseCases.getallproduct.run();
      emit(state.copyWith(response: response)); // Estado con la respuesta
    } catch (e) {
      emit(state.copyWith(
          response: Error("Error al cargar todos los productos: $e")));
    }
  }
}
