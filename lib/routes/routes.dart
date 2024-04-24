import 'package:flutter/material.dart';
import 'package:shoppinglist/components/home.dart';
import 'package:realm/realm.dart' as realm;
import 'package:shoppinglist/components/inicio.dart';
import 'package:shoppinglist/components/product_view.dart';
import 'package:shoppinglist/schemas/product.dart';
import 'package:shoppinglist/services/product_service.dart';
import 'package:shoppinglist/services/user_service.dart';

const appId = "application-0-dhitq"; 

///Asigna nombres a las diferentes vistas de la aplicacion, para facilitar la navegacion entre vistas 
Map<String, WidgetBuilder> getApplicationRoutes()  {
  Producto producto;
  // final realm.App atlasApp = realm.App(realm.AppConfiguration(appId));
  // final UserService userService = UserService(atlasApp); 
  // realm.User usuario = await userService.loginUser("lil@gmail.com", "123456");
  // final ProductService service;
  return <String, WidgetBuilder>{
    // '/': (BuildContext context) => const MyHomePage(title: 'Titulo pagina', service: service),
    // 'producto': (BuildContext context) => const ProductView(producto: Producto()),
    // 'inicio': (BuildContext context) => const Inicio(),
  }; 
}