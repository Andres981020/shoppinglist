
import 'package:realm/realm.dart';
import 'package:shoppinglist/schemas/item.dart';

class ItemService {

  final Configuration _config = Configuration.local([Item.schema], isReadOnly: false);
  late Realm _realm;

  ItemService() {
    openRealm();
  }

  openRealm() {
    _realm = Realm(_config);
  }

  closeRealm() {
    if(!_realm.isClosed) {
      _realm.close();
    }
  }

  // RealmResults<Item> getItems() {
  //   return_real
  // }
}