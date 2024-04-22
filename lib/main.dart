import 'package:flutter/material.dart';
import 'package:realm/realm.dart' as realm;
import 'package:shoppinglist/routes/routes.dart';
import 'package:shoppinglist/schemas/product.dart';
import 'package:shoppinglist/services/product_service.dart';
import 'package:shoppinglist/services/user_service.dart';
import './components/shopping_list_view.dart';
import 'components/home.dart';

const appId = "application-0-dhitq";

void main() async {
  final realm.App atlasApp = realm.App(realm.AppConfiguration(appId));
  final UserService userService = UserService(atlasApp);
  realm.User usuario = await userService.loginUser("lil@gmail.com", "123456");
  final ProductService service = ProductService(usuario);
  runApp(MyApp(
    service,
    usuario
  ));
}

class MyApp extends StatelessWidget {
  const MyApp(this.service, this.u, {super.key});
  final ProductService service;
  final realm.User u;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping List',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(
        'Shopping List',
        service,
        u
      ),
      debugShowCheckedModeBanner: false,
      routes: getApplicationRoutes(),
    );
  }
}
