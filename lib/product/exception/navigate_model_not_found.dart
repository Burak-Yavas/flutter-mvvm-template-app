class NavigateException<T> implements Exception {
  final dynamic model;

  NavigateException(this.model);

  @override
  String toString() {
    return "This Model Variable Doesnt Found In Route $model And $T";
  }
}
