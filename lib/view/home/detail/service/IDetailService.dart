import 'package:mvvm_app/view/_product/_utility/detail_utility_enums.dart';
import 'package:mvvm_app/view/home/detail/model/detail_model.dart';
import 'package:vexana/vexana.dart';

abstract class IDetailService {
  final INetworkManager manager;

  IDetailService(this.manager);

  Future<List<DetailModel>> fetchFavorites();

  Future<List<DetailModel>> fetchLimited({double? max = 50, double? min = 0});

  Future<List<DetailModel>> fetchSorted(
      {required DetailSortValues sortValue,
      DetailSortValuesType valuesType = DetailSortValuesType.ASC});
}
