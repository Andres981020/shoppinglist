import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:shoppinglist/components/add_item_view.dart';
import 'package:shoppinglist/components/item_list_view.dart';
import 'package:shoppinglist/schemas/item.dart';

class ShoppingItemListView extends StatelessWidget {
  final Function(String) onAdd;
  final Function(Item) onToggle;
  final Function(Item) onDelete;
  final Function(Item, String) onUpdate;
  final List<Item> items;
  final User u;
  const ShoppingItemListView(this.onAdd, this.onToggle, this.onDelete,
      this.onUpdate, this.items, this.u,
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
        AddItemView(onAdd: onAdd),
        Expanded(child: ItemListView(items, onToggle, onDelete, onUpdate, u))
      ]),
    );
  }
}
