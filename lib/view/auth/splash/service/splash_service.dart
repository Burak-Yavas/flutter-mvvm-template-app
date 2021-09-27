import 'package:mvvm_app/view/_product/_model/query/splash_query_enum.dart';
import 'package:mvvm_app/view/_product/enum/network_route_enum.dart';
import 'package:mvvm_app/view/auth/splash/model/splash_force_update_model.dart';
import 'package:mvvm_app/view/auth/splash/service/ISplashService.dart';
import 'package:vexana/src/interface/INetworkService.dart';
import 'package:vexana/vexana.dart';

class SplashService extends ISplashService {
  SplashService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<ForceUpdateModel?> checkDeviceVersion(
      {required String version, required String platform}) async {
    final response =
        await networkManager.send<ForceUpdateModel, ForceUpdateModel>(
            NetworkRoutes.VERSION.rawValue,
            parseModel: ForceUpdateModel(),
            method: RequestType.GET,
            queryParameters: Map.fromEntries([
              SplashServiceQuery.VERSION.toMapValue(version),
              SplashServiceQuery.PLATFORM.toMapValue(platform)
            ]));
    return response.data;
  }
}
