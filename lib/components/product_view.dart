import 'package:flutter/material.dart';
import 'package:shoppinglist/schemas/product.dart';

class ProductView extends StatelessWidget {
  final Producto producto;
  const ProductView(this.producto, {super.key});

  @override
  Widget build(BuildContext context) {
    final controllerText = TextEditingController();

    controllerText.text = "Hola";
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Propiedades del producto'),
        ),
        body: Container(

            // padding: const EdgeInsets.all(5),
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
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 180,
                  child: MaterialButton(onPressed: () {

                  }),
                )
              ],
            )
          ],
        )));
  }
}
