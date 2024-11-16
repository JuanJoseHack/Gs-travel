import 'dart:io';

import 'package:GsTravel/src/domain/models/Product.dart';
import 'package:GsTravel/src/domain/repository/ProductsRepository.dart';

class CreateProductUseCase {
  ProductsRepository productsRepository;

  CreateProductUseCase(this.productsRepository);

  run(Product product, List<File> files) =>
      productsRepository.create(product, files);
}
