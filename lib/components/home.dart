import 'package:flutter/material.dart';
import 'package:realm/realm.dart' as realm;
import 'package:realm/realm.dart';
import 'package:shoppinglist/components/shopping_list_view.dart';
import 'package:shoppinglist/schemas/product.dart';
import 'package:shoppinglist/services/product_service.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  final ProductService service;
  final User u; 
  
  const MyHomePage(
    this.title, 
    this.service,
    this.u,
    {super.key});
  
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
    final hola = products.changes.listen((event) { 
      print(event);
      print("Hola");
    });
  }

  onToggle(Producto producto) {
    debugPrint('Toggling status for ${producto.productName}');
    if (widget.service.toggleProductStatus(producto)) {
      loadProducts();
    } else {
      debugPrint(
          'Something went wrong while toggling status for ${producto.productName}');
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

  onUpdate(Producto producto, String name, double cantidad) {
    debugPrint('Updating ${producto.productName}');
    if(widget.service.updateProduct(producto, name, cantidad)) {
      loadProducts();
    } else {
      debugPrint('Something went wrong while updating ${producto.productName}');
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
      ),
      body: ShoppingListView(
        onAdd,
        onToggle,
        onDelete,
        onUpdate,
        products.toList(),
        widget.u
      ),
    );
  }
}
