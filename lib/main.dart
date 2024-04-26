import 'package:flutter/material.dart';
import 'package:realm/realm.dart' as realm;
import 'package:shoppinglist/components/inicio.dart';
import 'package:shoppinglist/routes/routes.dart';
import 'package:shoppinglist/services/item_service.dart';
import 'package:shoppinglist/services/product_service.dart';
import 'package:shoppinglist/services/user_service.dart';

const appId = "application-0-dhitq";

void main() async {
  final realm.App atlasApp = realm.App(realm.AppConfiguration(appId));
  final UserService userService = UserService(atlasApp);
  realm.User usuario = await userService.loginUser("lil@gmail.com", "123456");
  final ProductService service = ProductService(usuario);
  final ItemService itemService = ItemService(usuario);

  runApp(MyApp(
    service,
    itemService,
    usuario
  ));
}

class MyApp extends StatelessWidget {
  const MyApp(this.service, this.itemService, this.u, {super.key});
  final ProductService service;
  final ItemService itemService;
  final realm.User u;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Inicio(service, itemService, u),
      // home: MyHomePage(
      //   'Shopping List',
      //   service,
      //   u
      // ),
      debugShowCheckedModeBanner: false,
      routes: getApplicationRoutes(),
    );
  }
}
