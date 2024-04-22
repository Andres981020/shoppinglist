import 'package:flutter/material.dart';

class Algo extends StatefulWidget {
  const Algo({super.key});

  @override
  State<Algo> createState() => _AlgoState();
}

class _AlgoState extends State<Algo> {
  
  final controllerText = TextEditingController();


  @override
  void dispose() {
    controllerText.dispose();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Propiedades del producto'),
        ),
        body: Container(
          // padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              const SizedBox(
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Ingrese: '),
                  ],
                ),
              ),
              SizedBox(
                width: 250,
                child: Column(
                  children: [
                    TextField(
                      controller: controllerText,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Prueba'),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
        // const Row(
        //   children: [
        //     Column(

        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       children: [
        //         Text('Ingrese nombre: '),
        //       ],
        //     ),
        //     // Column(
        //     //   children: [
        //     //     TextField(
        //     //       style: TextStyle(fontSize: 20),
        //     //       // decoration: InputDecoration(hintText: 'Enter item'),
        //     //     ),
        //     //   ],
        //     // )
        //   ],
        // ),
        );
  }
}
