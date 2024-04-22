// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Producto extends _Producto
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  Producto(
    ObjectId id,
    String ownerId,
    String productName,
    double stock, {
    bool done = false,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Producto>({
        'done': false,
      });
    }
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'done', done);
    RealmObjectBase.set(this, 'owner_id', ownerId);
    RealmObjectBase.set(this, 'product_name', productName);
    RealmObjectBase.set(this, 'stock', stock);
  }

  Producto._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  bool get done => RealmObjectBase.get<bool>(this, 'done') as bool;
  @override
  set done(bool value) => RealmObjectBase.set(this, 'done', value);

  @override
  String get ownerId => RealmObjectBase.get<String>(this, 'owner_id') as String;
  @override
  set ownerId(String value) => RealmObjectBase.set(this, 'owner_id', value);

  @override
  String get productName =>
      RealmObjectBase.get<String>(this, 'product_name') as String;
  @override
  set productName(String value) =>
      RealmObjectBase.set(this, 'product_name', value);

  @override
  double get stock => RealmObjectBase.get<double>(this, 'stock') as double;
  @override
  set stock(double value) => RealmObjectBase.set(this, 'stock', value);

  @override
  Stream<RealmObjectChanges<Producto>> get changes =>
      RealmObjectBase.getChanges<Producto>(this);

  @override
  Producto freeze() => RealmObjectBase.freezeObject<Producto>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': id.toEJson(),
      'done': done.toEJson(),
      'owner_id': ownerId.toEJson(),
      'product_name': productName.toEJson(),
      'stock': stock.toEJson(),
    };
  }

  static EJsonValue _toEJson(Producto value) => value.toEJson();
  static Producto _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'done': EJsonValue done,
        'owner_id': EJsonValue ownerId,
        'product_name': EJsonValue productName,
        'stock': EJsonValue stock,
      } =>
        Producto(
          fromEJson(id),
          fromEJson(ownerId),
          fromEJson(productName),
          fromEJson(stock),
          done: fromEJson(done),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Producto._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, Producto, 'Producto', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('done', RealmPropertyType.bool),
      SchemaProperty('ownerId', RealmPropertyType.string, mapTo: 'owner_id'),
      SchemaProperty('productName', RealmPropertyType.string,
          mapTo: 'product_name'),
      SchemaProperty('stock', RealmPropertyType.double),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
