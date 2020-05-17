abstract class ObjectRepository<T extends Object> {
  void save(T item);

  Future<List<T>> loadAll();

  Future<T> load(String id);
}
