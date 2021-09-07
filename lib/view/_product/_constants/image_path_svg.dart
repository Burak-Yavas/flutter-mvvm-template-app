import 'package:mvvm_app/core/extension/string_extension.dart';

class ImagePathSvg {
  static ImagePathSvg? _instance = ImagePathSvg._init();
  static ImagePathSvg? get instance => _instance;
  ImagePathSvg._init();
  final svg1 = "svg1".toSVG;
  final svg2 = "svg2".toSVG;
  final svg3 = "svg3".toSVG;
}
