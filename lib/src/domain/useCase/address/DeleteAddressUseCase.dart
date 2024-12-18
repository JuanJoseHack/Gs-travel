import 'package:GsTravel/src/domain/repository/AddressRepository.dart';

class DeleteAddressUseCase {
  AddressRepository addressRepository;

  DeleteAddressUseCase(this.addressRepository);

  run(int id) => addressRepository.delete(id);
}
