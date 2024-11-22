import 'package:GsTravel/src/domain/models/MercadoPagoIdentificationType.dart';
import 'package:GsTravel/src/domain/useCase/MercadoPago/MercadoPagoUseCases.dart';
import 'package:GsTravel/src/domain/useCase/ShoppingBag/ShoppingBagUseCases.dart';
import 'package:GsTravel/src/domain/utils/Resource.dart';
import 'package:GsTravel/src/presentation/pages/client/payment/form/bloc/ClientPaymentFormEvent.dart';
import 'package:GsTravel/src/presentation/pages/client/payment/form/bloc/ClientPaymentFormState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientPaymentFormBloc
    extends Bloc<ClientPaymentFormEvent, ClientPaymentFormState> {
  MercadoPagoUseCases mercadoPagoUseCases;
  ShoppingBagUseCases shoppingBagUseCases;

  ClientPaymentFormBloc(this.mercadoPagoUseCases, this.shoppingBagUseCases)
      : super(ClientPaymentFormState()) {
    on<ClientPaymentFormInitEvent>(_onClientPaymentFormInitEvent);
    on<CreditCardChanged>(_onCreditCardChanged);
    on<IdentificationTypeChanged>(_onIdentificationTypeChanged);
    on<IdentificationNumberChanged>(_onIdentificationNumberChanged);
    on<FormSubmit>(_onFormSubmit);
  }

  final formKey = GlobalKey<FormState>();

  Future<void> _onClientPaymentFormInitEvent(ClientPaymentFormInitEvent event,
      Emitter<ClientPaymentFormState> emit) async {
    emit(state.copyWith(formKey: formKey));
    Resource response = await mercadoPagoUseCases.getIdentificationTypes.run();
    if (response is Success) {
      List<MercadoPagoIdentificationType> identificationTypes = response.data;
      emit(state.copyWith(
          identificationTypes: identificationTypes, formKey: formKey));
    }
    double totalToPay = await shoppingBagUseCases.getTotal.run();
    emit(state.copyWith(totalToPay: totalToPay, formKey: formKey));
  }

  Future<void> _onCreditCardChanged(
      CreditCardChanged event, Emitter<ClientPaymentFormState> emit) async {
    emit(state.copyWith(
        cardNumber: event.cardNumber,
        expireDate: event.expireDate,
        cardHolderName: event.cardHolderName,
        cvvCode: event.cvvCode,
        isCvvFocused: event.isCvvFocused,
        formKey: formKey));
  }

  Future<void> _onIdentificationTypeChanged(IdentificationTypeChanged event,
      Emitter<ClientPaymentFormState> emit) async {
    emit(state.copyWith(
        identificationType: event.identificationType, formKey: formKey));
  }

  Future<void> _onIdentificationNumberChanged(IdentificationNumberChanged event,
      Emitter<ClientPaymentFormState> emit) async {
    emit(state.copyWith(
        identificationNumber: event.identificationNumber, formKey: formKey));
  }

  Future<void> _onFormSubmit(
      FormSubmit event, Emitter<ClientPaymentFormState> emit) async {
    /* print('cardNumber ${state.cardNumber}');
    print('expireDate ${state.expireDate}');
    print('CardHolderName ${state.cardHolderName}');
    print('cvv ${state.cvvCode}');
    print('identificationType ${state.identificationType}');
    print('identificationNumber ${state.identificationNumber}');*/

    print('Form data ${state.toCardTokenBody().toJson()}');
    emit(state.copyWith(response: Loading()));
    Resource response =
        await mercadoPagoUseCases.createCardToken.run(state.toCardTokenBody());
    emit(state.copyWith(response: response));
  }
}
