import 'package:GsTravel/src/domain/useCase/categories/CategoriesUseCases.dart';
import 'package:GsTravel/src/domain/utils/Resource.dart';
import 'package:GsTravel/src/presentation/pages/client/category/list/bloc/ClienteCategoryListEvent.dart';
import 'package:GsTravel/src/presentation/pages/client/category/list/bloc/ClienteCategoryListState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClienteCategoryListBloc
    extends Bloc<ClienteCategoryListEvent, ClienteCategoryListState> {
  CategoriesUseCases categoriesUseCases;

  ClienteCategoryListBloc(this.categoriesUseCases)
      : super(ClienteCategoryListState()) {
    on<GetCategories>(_onGetCategories);
  }

  Future<void> _onGetCategories(
      GetCategories event, Emitter<ClienteCategoryListState> emit) async {
    emit(state.copyWith(response: Loading()));
    Resource response = await categoriesUseCases.getCategories.run();
    emit(state.copyWith(response: response));
  }
}
