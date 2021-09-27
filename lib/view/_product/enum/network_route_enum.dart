enum NetworkRoutes {
  LOGIN,
  FEED,
  RESTAURANT,
  SLIDER,
  DASHBOARD,
  DETAIL,
  PRICE,
  VERSION
}

extension NetworkRoutesString on NetworkRoutes {
  String get rawValue {
    switch (this) {
      case NetworkRoutes.LOGIN:
        return "login";
      case NetworkRoutes.FEED:
        return "house";
      case NetworkRoutes.RESTAURANT:
        return "friends";
      case NetworkRoutes.SLIDER:
        return "slider";
      case NetworkRoutes.DASHBOARD:
        return "games";
      case NetworkRoutes.DETAIL:
        return "burgers";
      case NetworkRoutes.PRICE:
        return "burgers/price";
      case NetworkRoutes.VERSION:
        return "version";
      default:
        throw Exception("Routes Cant Found!");
    }
  }
}
