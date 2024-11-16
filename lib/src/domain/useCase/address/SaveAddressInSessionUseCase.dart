import 'package:GsTravel/src/domain/models/Address.dart';
import 'package:GsTravel/src/domain/repository/AddressRepository.dart';

class SaveAddressInSessionUseCase {
  AddressRepository addressRepository;

  SaveAddressInSessionUseCase(this.addressRepository);

  run(Address address) => addressRepository.saveAddressInSession(address);
}
