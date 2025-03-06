import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:roqqu/app/router_paths.dart';
import 'package:roqqu/app/service_locator.dart';
import 'package:roqqu/core/utils/import.dart';
import 'package:roqqu/features/home/provider/app_provider.dart';
import 'package:roqqu/features/home/provider/socket_provider.dart';
import 'package:roqqu/features/home/repository/binance_repository.dart';
import 'package:roqqu/resources/resources.dart';

class SplashScreen extends HookWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _themeNotifier = context.watch<ThemeProvider>().lightTheme;
    final provider = context.watch<SocketProvider>();
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          _themeNotifier ? SvgIcons.darkLogo : SvgIcons.whiteLogo,
        ).animate(
          onComplete: (controller) {
            provider.getSymbols();
             context.pushReplacement(AppPath.home.path);
          },
        )..scaleXY(
            duration: Duration(seconds: 1),
          ),
      ),
    );
  }
}
