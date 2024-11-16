import 'package:GsTravel/src/domain/repository/AddressRepository.dart';

class DeleteAddressFromSessionUseCase {
  AddressRepository addressRepository;

  DeleteAddressFromSessionUseCase(this.addressRepository);

  run() => addressRepository.deleteFromSession();
}
