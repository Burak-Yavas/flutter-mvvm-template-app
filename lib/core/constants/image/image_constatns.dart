class ImageConstants {
  static ImageConstants? _instace;

  static ImageConstants get instance => _instace ??= ImageConstants._init();

  ImageConstants._init();

  String get login => toPng('login');
  String get splash => toPng('splash_5');

  String toPng(String name) => 'assets/image/$name.png';
}
