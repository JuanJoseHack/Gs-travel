import 'package:flutter/material.dart';
import 'package:ecommerce_v2/src/domain/models/Product.dart';

class CartProvider with ChangeNotifier {
  final List<Product> _items = [];
  List<Product> _searchResults = [];

  List<Product> get items => _items;
  List<Product> get searchResults =>
      _searchResults.isEmpty ? _items : _searchResults;

  int get itemsCount =>
      _items.fold(0, (sum, item) => sum + (item.quantity ?? 1));

  double get totalAmount {
    return _items.fold(
        0.0, (sum, item) => sum + (item.price * (item.quantity ?? 1)));
  }

  void addItem(Product product) {
    int index = _items.indexWhere((item) => item.id == product.id);

    if (index != -1) {
      _items[index].quantity = (_items[index].quantity ?? 1) + 1;
    } else {
      product.quantity = 1;
      _items.add(product);
    }
    notifyListeners();
  }

  void decreaseQuantity(Product product) {
    int index = _items.indexWhere((item) => item.id == product.id);

    if (index != -1 && _items[index].quantity! > 1) {
      _items[index].quantity = (_items[index].quantity ?? 1) - 1;
    } else if (index != -1 && _items[index].quantity == 1) {
      _items.removeAt(index);
    }
    notifyListeners();
  }

  void removeItem(Product product) {
    _items.removeWhere((item) => item.id == product.id);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  // Método de búsqueda de productos
  void searchProducts(String query) {
    if (query.isEmpty) {
      _searchResults = [];
    } else {
      _searchResults = _items.where((product) {
        return product.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }
}
