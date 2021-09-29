import 'package:vexana/vexana.dart';

import '../../../_product/_utility/detail_utility_enums.dart';
import '../model/detail_model.dart';

abstract class IDetailService {
  final INetworkManager manager;

  IDetailService(this.manager);

  Future<List<DetailModel>> fetchFavorites();

  Future<List<DetailModel>> fetchLimited({double? max = 50, double? min = 0});

  Future<List<DetailModel>> fetchSorted(
      {required DetailSortValues sortValue,
      DetailSortValuesType valuesType = DetailSortValuesType.ASC});
}
