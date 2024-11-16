import 'dart:io';

import 'package:GsTravel/src/domain/models/Product.dart';
import 'package:GsTravel/src/domain/repository/ProductsRepository.dart';

class UpdateProductUseCase {
  ProductsRepository productsRepository;

  UpdateProductUseCase(this.productsRepository);

  run(int id, Product product, List<File>? files, List<int>? imagesToUpdate) =>
      productsRepository.update(id, product, files, imagesToUpdate);
}
