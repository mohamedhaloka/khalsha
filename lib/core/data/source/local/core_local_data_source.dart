abstract class CoreLocalDataSource<T, In> {
  T get();

  void save(In data);

  void remove();
}
