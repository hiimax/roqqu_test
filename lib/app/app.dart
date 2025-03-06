import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:roqqu/app/provider_setup.dart';
import 'package:roqqu/app/router.dart';
import 'package:roqqu/core/utils/theme.dart';
import 'package:roqqu/features/home/provider/app_provider.dart';
import 'package:toastification/toastification.dart';

class Roqqu extends HookWidget {
  const Roqqu({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Consumer<ThemeProvider>(
        builder: (context, __,_) {
          return ToastificationWrapper(
            child: ScreenUtilInit(
              designSize: const Size(390, 1346),
              builder: (_, child) {
                return OverlaySupport.global(
                  child: AdaptiveTheme(
                      light: lightTheme,
                      dark: darkTheme,
                      initial: __.lightTheme
                          ? AdaptiveThemeMode.light
                          : AdaptiveThemeMode.dark,
                      // overrideMode: AdaptiveThemeMode.dark,
                      builder: (theme, darkTheme) {
                        return MaterialApp.router(
                          debugShowCheckedModeBanner: false,
                          darkTheme: darkTheme,
                          theme: theme,
                          themeMode:
                             __.lightTheme ? ThemeMode.light : ThemeMode.dark,
                          routerConfig: router,
                        );
                      }),
                );
              },
            ),
          );
        }
      ),
    );
  }
}
