import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/cart_screen.dart';
import 'package:flutter_application_1/screens/invoice_screen.dart';
import 'package:flutter_application_1/screens/product_detail_screen.dart';
import 'package:flutter_application_1/screens/product_form_screen.dart';
import 'package:flutter_application_1/screens/product_screen.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tienda de Productos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/products': (context) => ProductsScreen(),
        '/product-detail': (context) => ProductDetailScreen(),
        '/product-form': (context) => ProductFormScreen(),
        '/cart': (context) => CartScreen(),
        '/invoice': (context) => InvoiceScreen(),
      },
    );
  }
}
