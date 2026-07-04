abstract interface class Repository<T> {
  Future<void> add(T item);

  Future<void> remove(String id);

  Future<List<T>> getAll();

  Future<T?> findById(String id);

  Future<void> save();

  Future<void> load();
}