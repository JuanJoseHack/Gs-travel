import 'package:GsTravel/src/domain/models/MercadoPagoCardTokenBody.dart';
import 'package:GsTravel/src/domain/models/MercadoPagoCardTokenResponse.dart';
import 'package:GsTravel/src/domain/models/MercadoPagoIdentificationType.dart';
import 'package:GsTravel/src/domain/models/MercadoPagoInstallments.dart';
import 'package:GsTravel/src/domain/models/MercadoPagoPaymentBody.dart';
import 'package:GsTravel/src/domain/models/MercadoPagoPaymentResponse2.dart';
import 'package:GsTravel/src/domain/utils/Resource.dart';

abstract class MercadoPagoRepository {
  Future<Resource<List<MercadoPagoIdentificationType>>>
      getIdentificationTypes();
  Future<Resource<MercadoPagoCardTokenResponse>> createCardToken(
      MercadoPagoCardTokenBody mercadoPagoCardTokenBody);
  Future<Resource<MercadoPagoInstallments>> getInstallments(
      String firstSixDigits, String amount);
  Future<Resource<MercadoPagoPaymentResponse2>> createPayment(
      MercadoPagoPaymentBody mercadoPagoPaymentBody);
}
