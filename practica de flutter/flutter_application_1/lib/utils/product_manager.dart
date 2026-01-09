import 'package:flutter_application_1/models/products.dart';

class ProductManager {
  static final ProductManager _instance = ProductManager._internal();
  factory ProductManager() => _instance;
  ProductManager._internal();

  final List<Product> _localProducts = [];
  final Set<int> _deletedIds = {};
  int _nextId = 10000;

  void addProduct(Product product) {
    if (product.id == 0) {
      product.id = _nextId++;
    }
    _localProducts.add(product);
  }

  void updateProduct(Product product) {
    final index = _localProducts.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      _localProducts[index] = product;
    } else {
      _localProducts.add(product);
    }
  }

  void deleteProduct(int id) {
    _deletedIds.add(id);
    _localProducts.removeWhere((p) => p.id == id);
  }

  List<Product> mergeProducts(List<Product> apiProducts) {
    final Map<int, Product> productMap = {};
    for (var product in apiProducts) {
      if (!_deletedIds.contains(product.id)) {
        productMap[product.id] = product;
      }
    }
    for (var product in _localProducts) {
      productMap[product.id] = product;
    }

    return productMap.values.toList();
  }

  void clear() {
    _localProducts.clear();
    _deletedIds.clear();
  }
}
