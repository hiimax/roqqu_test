import 'package:go_router_paths/go_router_paths.dart';

class AppPath {
  static final splash = SplashPath();
  static final home = HomePath();

}

class SplashPath extends Path<SplashPath> {
  SplashPath() : super('/');
}

class HomePath extends Path<SplashPath> {
  HomePath() : super('/home');
}
