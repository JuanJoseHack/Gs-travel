import 'package:GsTravel/src/domain/repository/AddressRepository.dart';

class GetUserAddressUseCase {
  AddressRepository addressRepository;

  GetUserAddressUseCase(this.addressRepository);

  run(int idUser) => addressRepository.getUserAddress(idUser);
}
