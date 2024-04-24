
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:realm/realm.dart';
import 'package:shoppinglist/schemas/product.dart';

class ProductService {
  final User user;
  late final Realm realm;

  ProductService(this.user) {
    realm = openRealm();
  }

  Realm openRealm() {

    var realmConfig = Configuration.flexibleSync(user, [Producto.schema]);
    var realm = Realm(realmConfig);
    realm.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.add(realm.all<Producto>());
    });
    return realm;
  }

  closeRealm() {
    if(realm.isClosed) {
      realm.close();
    }
  }

  RealmResults<Producto> getProducts() {
    return realm.all<Producto>();
  }

  bool addProduct(String productName, double stock) {
    try {
      realm.write(() {
        realm.add<Producto>(Producto(ObjectId(), user.id, productName, stock, done: false));
      });
      return true;
    } on RealmException catch (e) {
      debugPrint(e.message);
      return false;
    }
  }

  bool updateProduct(Producto producto, String name, double cantidad) {
    try {
      realm.write(() {
        producto.productName = name;
        producto.stock = cantidad;
      });
      return true;
    } on RealmException catch(e) {
      debugPrint(e.message);
      return false;
    }
  }

  bool toggleProductStatus(Producto producto) {
    try {
      realm.write(() {
        producto.done = !producto.done;
      });
      return true;
    } on RealmException catch (e) {
      debugPrint(e.message);
      return false;
    }
  }
  bool deleteItem(Producto producto) {
    try {
      realm.write(() {
        realm.delete(producto);
      });
      return true;
    } on RealmException catch (e) {
      debugPrint(e.message);
      return false;
    }
  }
 }