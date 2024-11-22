import 'package:GsTravel/src/domain/models/MercadoPagoPaymentBody.dart';
import 'package:GsTravel/src/domain/repository/MercadoPagoRepository.dart';

class CreatePaymentUseCase {
  MercadoPagoRepository mercadoPagoRepository;

  CreatePaymentUseCase(this.mercadoPagoRepository);

  run(MercadoPagoPaymentBody mercadoPagoPaymentBody) =>
      mercadoPagoRepository.createPayment(mercadoPagoPaymentBody);
}
