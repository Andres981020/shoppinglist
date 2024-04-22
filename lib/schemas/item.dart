import 'package:realm/realm.dart';
part 'item.realm.dart';

@RealmModel()
class _Item {
  @PrimaryKey()
  late String text;
  late bool done;
}