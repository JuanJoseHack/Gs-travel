import 'package:GsTravel/src/domain/models/Product.dart';
import 'package:GsTravel/src/domain/useCase/ShoppingBag/ShoppingBagUseCases.dart';
import 'package:GsTravel/src/presentation/pages/client/ShoppingBag/bloc/ClientShoppingBagBloc.dart';
import 'package:GsTravel/src/presentation/pages/client/ShoppingBag/bloc/ClientShoppingBagEvent.dart';
import 'package:GsTravel/src/presentation/pages/client/product/detail/bloc/ClientProductDetailEvent.dart';
import 'package:GsTravel/src/presentation/pages/client/product/detail/bloc/ClientProductDetailState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientProductDetailBloc
    extends Bloc<ClientProductDetailEvent, ClientProductDetailState> {
  ShoppingBagUseCases shoppingBagUseCases;

  ClientProductDetailBloc(this.shoppingBagUseCases)
      : super(ClientProductDetailState()) {
    on<GetProducts>(_onGetProducts);
    on<AddItem>(_onAddItem);
    on<SubtractItem>(_onSubtractItem);
    on<AddProductToShoppingBag>(_onAddProductToShoppingBag);
    on<ResetState>(_onResetState);
    on<ResetQuantityCounter>(_onResetQuantityCounter);
  }

  Future<void> _onGetProducts(
      GetProducts event, Emitter<ClientProductDetailState> emit) async {
    List<Product> products = await shoppingBagUseCases.getProducts.run();
    int index = products.indexWhere((p) => p.id == event.product.id);
    if (index != -1) {
      emit(state.copyWith(quantity: products[index].quantity));
    }
  }

  Future<void> _onAddItem(
      AddItem event, Emitter<ClientProductDetailState> emit) async {
    emit(state.copyWith(quantity: state.quantity + 1));
  }

  Future<void> _onSubtractItem(
      SubtractItem event, Emitter<ClientProductDetailState> emit) async {
    if (state.quantity >= 1) {
      emit(state.copyWith(quantity: state.quantity - 1));
    }
  }

  Future<void> _onAddProductToShoppingBag(AddProductToShoppingBag event,
      Emitter<ClientProductDetailState> emit) async {
    // Asignar cantidad actual al producto
    event.product.quantity = state.quantity;

    // Agregar producto al carrito mediante `shoppingBagUseCases`
    await shoppingBagUseCases.add.run(event.product);

    // Emitir nuevo estado para actualizar la cantidad total
    emit(state.copyWith(
      totalProductsInCart: state.totalProductsInCart + state.quantity,
      quantity: 0, // Reinicia la cantidad para futuros productos
    ));

    // Notificar al `ClientShoppingBagBloc` para que actualice el carrito
    event.context.read<ClientShoppingBagBloc>().add(const GetShoppingBag());
  }

  Future<void> _onResetState(
      ResetState event, Emitter<ClientProductDetailState> emit) async {
    emit(state.copyWith(quantity: 0));
  }

  Future<void> _onResetQuantityCounter(ResetQuantityCounter event,
      Emitter<ClientProductDetailState> emit) async {
    emit(state.copyWith(quantity: 0));
  }
}
