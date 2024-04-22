import 'package:realm_dart/realm.dart';
part 'product.realm.dart';

// NOTE: These models are private and therefore should be copied into the same .dart file.
@RealmModel()
class _Producto {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  bool done = false;
  @MapTo('owner_id')
  late String ownerId;
  @MapTo('product_name')
  late String productName;
  late double stock;
}