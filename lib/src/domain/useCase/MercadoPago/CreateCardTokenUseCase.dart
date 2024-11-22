import 'package:GsTravel/src/domain/models/MercadoPagoCardTokenBody.dart';
import 'package:GsTravel/src/domain/repository/MercadoPagoRepository.dart';

class CreateCardTokenUseCase {
  MercadoPagoRepository mercadoPagoRepository;

  CreateCardTokenUseCase(this.mercadoPagoRepository);

  run(MercadoPagoCardTokenBody mercadoPagoCardTokenBody) =>
      mercadoPagoRepository.createCardToken(mercadoPagoCardTokenBody);
}
