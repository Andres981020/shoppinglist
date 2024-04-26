
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:shoppinglist/schemas/item.dart';
import 'package:shoppinglist/schemas/product.dart';

class ItemService with ChangeNotifier {
  final User user;
  late final Realm realm;

  ItemService(this.user) {
    realm = openRealm();
  }

  openRealm() {
    var realmConfig = Configuration.flexibleSync(user, [Item.schema, Producto.schema]);
    var realm = Realm(realmConfig);
    realm.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.add(realm.all<Item>());
    });

    return realm;
  }
 
  closeRealm() {
    if(!realm.isClosed) {
      realm.close();
    }
  }

  RealmResults<Item> getItems() {
    return realm.all<Item>();
  }

  bool addItem(String productName) {
    try {
      realm.write(() {
        realm.add<Item>(Item(ObjectId(), productName, user.id, isComplete: false));
      });
      return true;
    } on RealmException catch (e) {
      debugPrint(e.message);
      return false;
    }
  }

  bool updateItem(Item item, String name) {
    try {
      realm.write(() {
        item.summary = name;
      });
      notifyListeners();
      return true;
    } on RealmException catch(e) {
      debugPrint(e.message);
      return false;
    }
    
  }

  bool toggleItemStatus(Item item) { 
    try {
      realm.write(() {
        item.isComplete = !item.isComplete;
      });
      return true;
    } on RealmException catch (e) {
      debugPrint(e.message);
      return false;
    }
  }
  bool deleteItem(Item item) {
    try {
      realm.write(() {
        realm.delete(item);
      });
      return true;
    } on RealmException catch (e) {
      debugPrint(e.message);
      return false;
    }
  }
}