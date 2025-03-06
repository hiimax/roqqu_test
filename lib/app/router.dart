import 'package:roqqu/app/router_paths.dart';
import 'package:roqqu/core/utils/import.dart';
import 'package:roqqu/features/home/screens/home.dart';
import 'package:roqqu/features/home/screens/splashscreen.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final rootScaffoldStateKey = GlobalKey<ScaffoldState>();

final router = GoRouter(
  debugLogDiagnostics: kDebugMode,
  navigatorKey: rootNavigatorKey,
  // initialLocation: AppPath.timeline.goRoute,
  observers: [
    // FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
  ],
  routes: [
    GoRoute(
      path: AppPath.splash.goRoute,
      name: AppPath.splash.path,
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: AppPath.home.goRoute,
      name: AppPath.home.path,
      builder: (context, state) => HomeScreen(),
    ),
  ],
);
