import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:shoppinglist/schemas/product.dart';

class ProductView extends StatelessWidget {
  final Function(Producto, String, double) onUpdate;
  final Producto producto;
  final User u;
  const ProductView(this.onUpdate, this.producto, this.u, {super.key});

  @override
  Widget build(BuildContext context) {
    final Producto p = Producto(
        producto.id, producto.ownerId, producto.productName, producto.stock);
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
                        initialValue: producto.productName,
                        // controller: controllerName,
                        onChanged: (value) {
                          p.productName = value;
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Stock del producto: '),
                    ],
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: Column(
                    children: [
                      TextFormField(
                        initialValue: producto.stock.toString(),
                        onChanged: (value) {
                          p.stock = double.parse(value);
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
                        onUpdate(producto, p.productName, p.stock);
                        Navigator.pop(context);
                      }),
                )
              ],
            )
          ],
        )));
  }
}
