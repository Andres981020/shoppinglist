import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:shoppinglist/components/item_view.dart';
import 'package:shoppinglist/schemas/item.dart';

class ItemListView extends StatelessWidget {
  final List<Item> items;
  final Function(Item) onToggle;
  final Function(Item) onDelete;
  final Function(Item, String) onUpdate;
  final User u;
  const ItemListView(
    this.items,
    this.onToggle,
    this.onDelete,
    this.onUpdate,
    this.u,
    {super.key}
    );
  
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.all(10),
        shrinkWrap: true,
        itemBuilder: getItemBuilder,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: getSeparatorBuilder,
        itemCount: items.length);
  }

  Widget getItemBuilder(BuildContext context, int index) {
    
    Item item = items[index];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          child: Row(children: [
          Checkbox(
              tristate: true,
              value: item.isComplete,
              onChanged: (bool? value) => {onToggle(item)}),
          Text(item.summary,
              style: TextStyle(
                  decorationColor: Colors.indigo,
                  decorationThickness: 2,
                  fontSize: 20,
                  decoration: getTextDecoration(item.isComplete)))
        ]),
          onTap: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => ItemView(onUpdate, item, u)));
          },
        ),
        IconButton(
            onPressed: () => {onDelete(item)},
            icon: Icon(
              Icons.delete,
              color: Colors.indigo,
              size: 25,
              semanticLabel: 'Delete ${item.summary}',
            ))
      ],
    );
  }

  Widget getSeparatorBuilder(BuildContext context, int index) {
    return const Divider(
      thickness: 1,
      color: Colors.indigo,
    );
  }

  TextDecoration getTextDecoration(bool isDone) {
    return isDone ? TextDecoration.lineThrough : TextDecoration.none;
  }
}