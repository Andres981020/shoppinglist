
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:realm/realm.dart';
import 'package:shoppinglist/schemas/product.dart';

class ProductService {
  final User user;
  // final Configuration _config = Configuration.local([Producto.schema], isReadOnly: false);
  late final Realm realm;

  ProductService(this.user) {
    realm = openRealm();
  }

  Realm openRealm() {
    // realm = Realm(_config);

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

  bool updateProduct(Producto producto) {
    try {
      realm.write(() {
        producto.productName = producto.productName;
        producto.stock = producto.stock;
      });
      return true;
    } on RealmException catch(e) {
      debugPrint(e.message);
      return false;
    }
  }

  bool toggleProductStatus(Producto producto) {
    print('toggle');
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