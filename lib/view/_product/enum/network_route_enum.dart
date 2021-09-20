enum NetworkRoutes { LOGIN, FEED, RESTAURANT, SLIDER, DASHBOARD }

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
      default:
        throw Exception("Routes Cant Found!");
    }
  }
}
