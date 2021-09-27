enum SplashServiceQuery { VERSION, PLATFORM }

extension SplashServiceQueryExtension on SplashServiceQuery {
  MapEntry<String, String> toMapValue(String value) {
    switch (this) {
      case SplashServiceQuery.PLATFORM:
        return MapEntry("platform", value);
      case SplashServiceQuery.VERSION:
        return MapEntry("version", value);
    }
  }
}
