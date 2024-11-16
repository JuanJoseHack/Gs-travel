import 'package:GsTravel/src/domain/models/Address.dart';
import 'package:GsTravel/src/domain/repository/AddressRepository.dart';

class CreateAddressUseCase {
  AddressRepository addressRepository;

  CreateAddressUseCase(this.addressRepository);

  run(Address address) => addressRepository.create(address);
}
