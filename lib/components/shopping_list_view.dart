
import 'package:flutter/material.dart';
import 'package:shoppinglist/components/add_product_view.dart';
import 'package:shoppinglist/components/product_list_view.dart';
import 'package:shoppinglist/schemas/product.dart';

class ShoppingListView extends StatelessWidget {
  final Function(String) onAdd;
  final Function(Producto) onToggle;
  final Function(Producto) onDelete;
  final List<Producto> products;
  const ShoppingListView(
      {Key? key,
      required this.onAdd,
      required this.onToggle,
      required this.onDelete,
      required this.products})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, Colors.indigoAccent])),
      child: Column(children: [
        AddProductView(onAdd: onAdd),
        Expanded(
            child: ProductListView(
          products: products,
          onToggle: onToggle,
          onDelete: onDelete,
        ))
      ]),
    );
  }
}