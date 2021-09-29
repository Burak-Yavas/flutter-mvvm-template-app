import 'package:vexana/vexana.dart';

import '../model/splash_force_update_model.dart';

abstract class ISplashService {
  final INetworkManager networkManager;

  ISplashService(this.networkManager);
  Future<ForceUpdateModel?> checkDeviceVersion(
      {required String version, required String platform});
}
