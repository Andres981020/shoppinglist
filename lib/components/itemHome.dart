import 'package:flutter/material.dart';
import 'package:realm/realm.dart' as realm;
import 'package:realm/realm.dart';
import 'package:shoppinglist/components/shopping_item_list_view.dart';
import 'package:shoppinglist/schemas/item.dart';
import 'package:shoppinglist/services/item_service.dart';

class ItemHome extends StatefulWidget {
  final String title;
  final ItemService service;
  final User u;
  const ItemHome(
    this.title,
    this.service,
    this.u, 
    {super.key});

  @override
  State <ItemHome> createState() =>  _ItemHomeState();
}

class  _ItemHomeState extends State<ItemHome> {
  late realm.RealmResults<Item> items;
  onAdd(String text) {
    debugPrint('Adding $text');
    if (widget.service.addItem(text)) {
      debugPrint('Added $text');
      loadItems();
    } else {
      debugPrint('Something went wrong while adding $text');
    }
  }

  onToggle(Item item) {
    debugPrint('Toggling status for ${item.summary}');
    if (widget.service.toggleItemStatus(item)) {
      loadItems();
    } else {
      debugPrint(
          'Something went wrong while toggling status for ${item.summary}');
    }
  }

  onDelete(Item item) {
    debugPrint('Deleting ${item.summary}');
    if (widget.service.deleteItem(item)) {
      loadItems();
    } else {
      debugPrint('Something went wrong while deleting ${item.summary}');
    }
  }

  onUpdate(Item item, String name) {
    debugPrint('Updating ${item.summary}');
    if(widget.service.updateItem(item, name)) {
      loadItems();
    } else {
      debugPrint('Something went wrong while updating ${item.summary}');
    }
    
  }

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  void loadItems() {
    setState(() {
      items = widget.service.getItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(color: Colors.white),),
      ),
      body: ShoppingItemListView(
        onAdd, 
        onToggle, 
        onDelete, 
        onUpdate,
        items.toList(), 
        widget.u)
    );
  }
}