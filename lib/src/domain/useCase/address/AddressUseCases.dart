import 'package:GsTravel/src/domain/useCase/address/CreateAddressUseCase.dart';
import 'package:GsTravel/src/domain/useCase/address/DeleteAddressFromSessionUseCase.dart';
import 'package:GsTravel/src/domain/useCase/address/DeleteAddressUseCase.dart';
import 'package:GsTravel/src/domain/useCase/address/GetAddressSessionUseCase.dart';
import 'package:GsTravel/src/domain/useCase/address/GetUserAddressUseCase.dart';
import 'package:GsTravel/src/domain/useCase/address/SaveAddressInSessionUseCase.dart';

class AddressUseCases {
  CreateAddressUseCase create;
  GetUserAddressUseCase getUserAddress;
  SaveAddressInSessionUseCase saveAddressInSession;
  GetAddressSessionUseCase getAddressSession;
  DeleteAddressUseCase delete;
  DeleteAddressFromSessionUseCase deleteFromSession;

  AddressUseCases({
    required this.create,
    required this.getUserAddress,
    required this.saveAddressInSession,
    required this.getAddressSession,
    required this.delete,
    required this.deleteFromSession,
  });
}
