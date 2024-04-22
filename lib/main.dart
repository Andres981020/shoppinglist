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
    service: service,
  ));
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.service}) : super(key: key);
  final ProductService service;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping List',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(
        title: 'Shopping List',
        service: service,
      ),
      debugShowCheckedModeBanner: false,
      routes: getApplicationRoutes(),

    );
  }
}
