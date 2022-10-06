class AssetsPath {
  static final AssetsPath _instance = AssetsPath._init();
  AssetsPath._init();

  factory AssetsPath() {
    return _instance;
  }

  // !SVG
  final String loginSVG = 'assets/svg/login.svg';
  final String googleSVG = 'assets/svg/google.svg';

}
