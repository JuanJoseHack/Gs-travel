import 'package:GsTravel/src/domain/repository/MercadoPagoRepository.dart';

class GetIdentificationTypesUseCase {
  MercadoPagoRepository mercadoPagoRepository;

  GetIdentificationTypesUseCase(this.mercadoPagoRepository);

  run() => mercadoPagoRepository.getIdentificationTypes();
}
