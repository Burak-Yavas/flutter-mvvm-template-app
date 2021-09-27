import 'package:mvvm_app/view/auth/splash/model/splash_force_update_model.dart';
import 'package:vexana/vexana.dart';

abstract class ISplashService {
  final INetworkManager networkManager;

  ISplashService(this.networkManager);
  Future<ForceUpdateModel?> checkDeviceVersion(
      {required String version, required String platform});
}
