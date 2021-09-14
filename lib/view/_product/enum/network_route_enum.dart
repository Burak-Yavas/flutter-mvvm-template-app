enum NetworkRoutes { LOGIN, FEED }

extension NetworkRoutesString on NetworkRoutes {
  String get rawValue {
    switch (this) {
      case NetworkRoutes.LOGIN:
        return "login";
      case NetworkRoutes.FEED:
        return "house";
      default:
        throw Exception("Routes Cant Found!");
    }
  }
}
