enum DetailSortValues { NAME, PRICE, RATES, UPDATED }
enum DetailSortValuesType { ASC, DSC }
enum DetailQueryParameters { FAVORITE, SORT, SORT_TYPE, MIN, MAX }

extension DetailSortValuesExtension on DetailSortValues {
  String get rawValue {
    switch (this) {
      case DetailSortValues.NAME:
        return "name";
      case DetailSortValues.PRICE:
        return "price";
      case DetailSortValues.RATES:
        return "rates";
      case DetailSortValues.UPDATED:
        return "updated";
    }
  }
}

extension DetailSortValuesTypeExtension on DetailSortValuesType {
  int get rawValue {
    switch (this) {
      case DetailSortValuesType.ASC:
        return -1;
      case DetailSortValuesType.DSC:
        return 1;
    }
  }
}

extension DetailQueryParametersExtension on DetailQueryParameters {
  MapEntry<String, dynamic> rawValue(dynamic value) {
    switch (this) {
      case DetailQueryParameters.FAVORITE:
        return MapEntry("isFavorite", value);
      case DetailQueryParameters.SORT:
        return MapEntry("sort", value);
      case DetailQueryParameters.SORT_TYPE:
        return MapEntry("sortType", value);
      case DetailQueryParameters.MIN:
        return MapEntry("min", value);
      case DetailQueryParameters.MAX:
        return MapEntry("max", value);
    }
  }
}
