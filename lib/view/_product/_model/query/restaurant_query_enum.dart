enum RestaurantQueryEnum { LIMIT, Q }

extension FriendQueryEnumString on RestaurantQueryEnum {
  String get rawValue {
    switch (this) {
      case RestaurantQueryEnum.LIMIT:
        return 'limit';
      case RestaurantQueryEnum.Q:
        return 'q';
      default:
        throw Exception('Routes Not FouND');
    }
  }
}
