enum NetworkRoutes { LOGIN, FEED, RESTAURANT }

extension NetworkRoutesString on NetworkRoutes {
  String get rawValue {
    switch (this) {
      case NetworkRoutes.LOGIN:
        return "login";
      case NetworkRoutes.FEED:
        return "house";
      case NetworkRoutes.RESTAURANT:
        return "friends";
      default:
        throw Exception("Routes Cant Found!");
    }
  }
}
