import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:shoppinglist/components/add_product_view.dart';
import 'package:shoppinglist/components/product_list_view.dart';
import 'package:shoppinglist/schemas/product.dart';

class ShoppingListView extends StatelessWidget {
  final Function(String) onAdd;
  final Function(Producto) onToggle;
  final Function(Producto) onDelete;
  final Function(Producto, String, double) onUpdate;
  final List<Producto> products;
  final User u;
  const ShoppingListView(
      this.onAdd, this.onToggle, this.onDelete, this.onUpdate, this.products, this.u,
      {super.key});
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
          products,
          onToggle,
          onDelete,
          onUpdate,
          u
        ))
      ]),
    );
  }
}
