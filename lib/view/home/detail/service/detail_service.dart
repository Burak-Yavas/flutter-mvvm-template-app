import 'package:flutter/material.dart';
import 'package:mvvm_app/view/_product/_utility/detail_utility_enums.dart';
import 'package:mvvm_app/view/_product/_utility/serivce_helper.dart';
import 'package:mvvm_app/view/_product/enum/network_route_enum.dart';
import 'package:mvvm_app/view/home/detail/model/detail_model.dart';
import 'package:mvvm_app/view/home/detail/service/IDetailService.dart';
import 'package:vexana/vexana.dart';

class DetailService extends IDetailService with ServiceHelper {
  DetailService(INetworkManager manager) : super(manager);

  @override
  Future<List<DetailModel>> fetchFavorites() async {
    final response = await manager.send<DetailModel, List<DetailModel>>(
        NetworkRoutes.DETAIL.rawValue,
        parseModel: DetailModel(),
        method: RequestType.GET,
        queryParameters:
            Map.fromEntries([DetailQueryParameters.FAVORITE.rawValue(true)]));
    return response.data ?? [];
  }

  @override
  Future<List<DetailModel>> fetchLimited(
      {double? max = 50, double? min = 0}) async {
    final response = await manager.send<DetailModel, List<DetailModel>>(
        NetworkRoutes.PRICE.rawValue,
        parseModel: DetailModel(),
        method: RequestType.GET,
        queryParameters: Map.fromEntries([
          DetailQueryParameters.MIN.rawValue(min),
          DetailQueryParameters.MAX.rawValue(max)
        ]));
    return response.data ?? [];
  }

  @override
  Future<List<DetailModel>> fetchSorted(
      {required DetailSortValues sortValue,
      DetailSortValuesType valuesType = DetailSortValuesType.ASC}) async {
    final response = await manager.send<DetailModel, List<DetailModel>>(
        NetworkRoutes.DETAIL.rawValue,
        parseModel: DetailModel(),
        method: RequestType.GET,
        queryParameters: Map.fromEntries([
          DetailQueryParameters.SORT.rawValue(sortValue.rawValue),
          DetailQueryParameters.SORT_TYPE.rawValue(valuesType.rawValue)
        ]));
    return response.data ?? [];
  }
}
