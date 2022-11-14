class AssetsPath {
  static final AssetsPath _instance = AssetsPath._init();
  AssetsPath._init();

  factory AssetsPath() {
    return _instance;
  }

  // !SVG
  final String loginSVG = 'assets/svg/login.svg';
  final String googleSVG = 'assets/svg/google.svg';
  final String backgroundSVG = 'assets/svg/background.svg';
  final String errorSVG = 'assets/svg/error.svg';
  final String successSVG = 'assets/svg/success.svg';
  final String warningSVG = 'assets/svg/warning.svg';
  final String logoSVG = 'assets/svg/logo.svg';

  // !Category
  final String sportSVG = 'assets/svg/sport.svg';
  final String historySVG = 'assets/svg/history.svg';
  final String geographySVG = 'assets/svg/geography.svg';
  final String entertainmentSVG = 'assets/svg/entertainment.svg';
  final String generalSVG = 'assets/svg/general.svg';
  final String mathSVG = 'assets/svg/math.svg';
}
