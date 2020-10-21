import 'package:floor/floor.dart';

abstract class AbstractDao<T> {
  @insert
  Future<int> insertItem(T item);

  @update
  Future<int> updateItem(T item);

  @delete
  Future<int> deleteItem(T item);

  @delete
  Future<int> deleteAllItems(List<T> items);

}