abstract class LocalStorage<T, In> {
  T get();

  void save(In data);

  void remove();
}
