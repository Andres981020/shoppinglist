import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:shoppinglist/components/home.dart';
import 'package:shoppinglist/components/itemHome.dart';
import 'package:shoppinglist/services/item_service.dart';
import 'package:shoppinglist/services/product_service.dart';

class Inicio extends StatelessWidget {
  final ProductService productoService;
  final ItemService itemService;
  final User u;
  const Inicio(this.productoService, this.itemService, this.u, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio de la app'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(30),
        child: Row(
          children: [
            Column(
              children: [
                SizedBox(
                  width: 180,
                  child: MaterialButton(
                      color: Colors.blueAccent,
                      onPressed: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => MyHomePage('Shopping List', productoService, u))
                          );
                      },
                      child: const Text('Boton 1')),
                )
              ],
            ),
            const SizedBox(width: 15,),
            Column(
              children: [
                SizedBox(
                  width: 180,
                  child: MaterialButton(
                      color: Colors.blueAccent,
                      onPressed: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => ItemHome('Item List', itemService, u)));
                      },
                      child: const Text('Boton 2')),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
