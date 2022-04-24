class ImageConstants {
  static ImageConstants? _instance;

  static ImageConstants? get instance => _instance ??= ImageConstants._init();

  ImageConstants._init();

  static const splashImage = 'assets/images/Logo.png';
}
