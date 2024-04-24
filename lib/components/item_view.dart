import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:shoppinglist/schemas/item.dart';

class ItemView extends StatelessWidget {
  final Function(Item, String) onUpdate;
  final Item item;
  final User u;
  const ItemView(this.onUpdate, this.item, this.u,{super.key});

  @override
  Widget build(BuildContext context) {
    final Item i = Item(item.id, item.summary, item.ownerId);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Propiedades del producto'),
        ),
        body: Container(
          margin: const EdgeInsets.all(20),
            child: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Nombre del producto: '),
                    ],
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: Column(
                    children: [
                      TextFormField(
                        initialValue: item.summary,
                        onChanged: (value) {
                          i.summary = value;
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                SizedBox(
                  width: 180,
                  child: MaterialButton(
                      color: Colors.blueAccent,
                      child: const Text("Editar"),
                      onPressed: () {
                        onUpdate(item, i.summary);
                        Navigator.pop(context);
                      }),
                )
              ],
            )
          ],
        )));
  }
}