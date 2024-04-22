import 'package:flutter/material.dart';
import 'package:shoppinglist/components/product_view.dart';
import 'package:shoppinglist/schemas/product.dart';

class ProductListView extends StatelessWidget {
  final List<Producto> products;
  final Function(Producto) onToggle;
  final Function(Producto) onDelete;
  const ProductListView(
      {Key? key,
      required this.products,
      required this.onToggle,
      required this.onDelete})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.all(10),
        shrinkWrap: true,
        itemBuilder: getItemBuilder,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: getSeparatorBuilder,
        itemCount: products.length);
  }

  Widget getItemBuilder(BuildContext context, int index) {
    
    Producto product = products[index];
    print(product.productName + " nombre");
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          child: Row(children: [
          Checkbox(
              tristate: true,
              value: product.done,
              onChanged: (bool? value) => {onToggle(product)}),
          Text(product.productName,
              style: TextStyle(
                  decorationColor: Colors.indigo,
                  decorationThickness: 2,
                  fontSize: 20,
                  decoration: getTextDecoration(product.done)))
        ]),
          onTap: () {
            // Navigator.pushNamed(context, "producto");
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => ProductView(product))
              );
          },
        ),
        IconButton(
            onPressed: () => {onDelete(product)},
            icon: Icon(
              Icons.delete,
              color: Colors.indigo,
              size: 25,
              semanticLabel: 'Delete ${product.productName}',
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
