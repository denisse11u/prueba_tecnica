import 'dart:convert';
import 'package:flutter_application_1/models/products.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static const String baseUrl = 'https://fakestoreapi.com';

  Future<List<Product>> getProducts() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/products'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception('Error al cargar productos');
      }
    } catch (e) {
      throw Exception('Error de conexión');
    }
  }

  Future<Product> getProductById(int id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/products/$id'));

      if (response.statusCode == 200) {
        return Product.fromJson(json.decode(response.body));
      } else {
        throw Exception('Producto no encontrado');
      }
    } catch (e) {
      throw Exception('Error de conexión');
    }
  }

  Future<Product> createProduct(Product product) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/products'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(product.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Product.fromJson(json.decode(response.body));
      } else {
        throw Exception('Error al crear producto');
      }
    } catch (e) {
      throw Exception('Error de conexión');
    }
  }

  Future<Product> updateProduct(int id, Product product) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/products/$id'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(product.toJson()),
      );

      if (response.statusCode == 200) {
        return Product.fromJson(json.decode(response.body));
      } else {
        throw Exception('Error al actualizar producto');
      }
    } catch (e) {
      throw Exception('Error de conexión');
    }
  }

  Future<void> deleteProduct(int id) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/products/$id'));

      if (response.statusCode != 200) {
        throw Exception('Error al eliminar producto');
      }
    } catch (e) {
      throw Exception('Error de conexión');
    }
  }
}
