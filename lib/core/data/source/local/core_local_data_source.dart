abstract class CoreLocalDataSource<T, In> {
  T get();

  Future<void> save(In data);

  void remove();
}
