import 'package:GsTravel/src/domain/models/Address.dart';
import 'package:GsTravel/src/domain/models/AuthResponse.dart';
import 'package:GsTravel/src/domain/models/MercadoPagoCardTokenBody.dart';
import 'package:GsTravel/src/domain/models/MercadoPagoPaymentBody.dart';
import 'package:GsTravel/src/domain/models/Order.dart';
import 'package:GsTravel/src/domain/models/Product.dart';
import 'package:GsTravel/src/domain/useCase/Auth/AuthUseCases.dart';
import 'package:GsTravel/src/domain/useCase/MercadoPago/MercadoPagoUseCases.dart';
import 'package:GsTravel/src/domain/useCase/ShoppingBag/ShoppingBagUseCases.dart';
import 'package:GsTravel/src/domain/useCase/address/AddressUseCases.dart';
import 'package:GsTravel/src/domain/utils/Resource.dart';
import 'package:GsTravel/src/presentation/pages/client/payment/installments/bloc/ClientPaymentInstallmentsEvent.dart';
import 'package:GsTravel/src/presentation/pages/client/payment/installments/bloc/ClientPaymentInstallmentsState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientPaymentInstallmentsBloc extends Bloc<ClientPaymentInstallmentsEvent,
    ClientPaymentInstallmentsState> {
  MercadoPagoUseCases mercadoPagoUseCases;
  AuthUseCases authUseCases;
  ShoppingBagUseCases shoppingBagUseCases;
  AddressUseCases addressUseCases;

  ClientPaymentInstallmentsBloc(this.mercadoPagoUseCases, this.authUseCases,
      this.shoppingBagUseCases, this.addressUseCases)
      : super(ClientPaymentInstallmentsState()) {
    on<GetInstallments>(_onGetInstallments);
    on<InstallmentChanged>(_onInstallmentChanged);
    on<FormSubmit>(_onFormSubmit);
  }

  Future<void> _onGetInstallments(GetInstallments event,
      Emitter<ClientPaymentInstallmentsState> emit) async {
    emit(state.copyWith(responseInstallments: Loading()));
    Resource response = await mercadoPagoUseCases.getInstallments
        .run(event.firstSixDigits, event.amount);
    emit(state.copyWith(responseInstallments: response));
  }

  Future<void> _onInstallmentChanged(InstallmentChanged event,
      Emitter<ClientPaymentInstallmentsState> emit) async {
    emit(state.copyWith(installment: event.installment));
  }

  Future<void> _onFormSubmit(
      FormSubmit event, Emitter<ClientPaymentInstallmentsState> emit) async {
    emit(state.copyWith(responsePayment: Loading()));

    double totalToPay = await shoppingBagUseCases.getTotal.run();
    AuthResponse authResponse = await authUseCases.getUserSession.run();
    Address address = await addressUseCases.getAddressSession.run();
    List<Product> products = await shoppingBagUseCases.getProducts.run();

    // Convertir los productos para que `price` sea de tipo int
    List<Product> sanitizedProducts = products.map((product) {
      // Sanitize y convertir price a int
      final productJson = product.toJson();
      productJson["price"] =
          productJson["price"].toInt(); // Convertir `price` a int
      // Convertir de nuevo el Map a un objeto Product
      return Product.fromJson(productJson);
    }).toList();

    MercadoPagoPaymentBody body = MercadoPagoPaymentBody(
        transactionAmount: totalToPay.toInt(),
        token: event.mercadoPagoCardTokenResponse.id,
        installments: int.parse(state.installment!),
        issuerId: event.installments.issuer.id,
        paymentMethodId: event.installments.paymentMethodId,
        payer: Payer(
            email: authResponse.user.email!,
            identification: Identification(
                number: event.mercadoPagoCardTokenResponse.cardholder
                    .identification.number,
                type: event.mercadoPagoCardTokenResponse.cardholder
                    .identification.type)),
        order: Order(
            idClient: authResponse.user.id!,
            idAddress: address.id!,
            products: sanitizedProducts));
    Resource responsePayment =
        await mercadoPagoUseCases.createPaymentUseCase.run(body);
    emit(state.copyWith(responsePayment: responsePayment));
  }
}
