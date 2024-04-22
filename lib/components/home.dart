import 'package:flutter/material.dart';
import 'package:realm/realm.dart' as realm;
import 'package:shoppinglist/components/shopping_list_view.dart';
import 'package:shoppinglist/schemas/product.dart';
import 'package:shoppinglist/services/product_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, required this.service})
      : super(key: key);
  final String title;
  final ProductService service;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late realm.RealmResults<Producto> products;
  onAdd(String text) {
    debugPrint('Adding $text');
    if (widget.service.addProduct(text, 15)) {
      debugPrint('Added $text');
      loadProducts();
    } else {
      debugPrint('Something went wrong while adding $text');
    }
  }
  onToggle(Producto producto) {
    debugPrint('Toggling status for ${producto.productName}');
    if (widget.service.toggleProductStatus(producto)) {
      loadProducts();
    } else {
      debugPrint('Something went wrong while toggling status for ${producto.productName}');
    }
  }
  onDelete(Producto producto) {
    debugPrint('Deleting ${producto.productName}');
    if (widget.service.deleteItem(producto)) {
      loadProducts();
    } else {
      debugPrint('Something went wrong while deleting ${producto.productName}');
    }
  }
  @override
  void initState() {
    super.initState();
    loadProducts();
  }
  void loadProducts() {
    setState(() {
      products = widget.service.getProducts();
      print(products.length);
      print("Entro aqui");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
      ),
      body: ShoppingListView(
        products: products.toList(),
        onAdd: onAdd,
        onToggle: onToggle,
        onDelete: onDelete,
      ),
    );
  }
}