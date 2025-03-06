import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:roqqu/app/service_locator.dart';
import 'package:roqqu/core/storage/cache_storage.dart';
import 'package:roqqu/env/env.dart';

Future<void> bootstrap(
  FutureOr<Widget> Function() builder, {
  required AppEnvironment environment,
}) async {
  try {
    await WidgetsFlutterBinding.ensureInitialized();
    FlutterError.onError = (details) {
      log(
        details.exceptionAsString(),
        stackTrace: details.stack,
        name: details.exception.runtimeType.toString(),
      );
    };
    await setupLocator(environment: environment);
    await locator.get<SharedPrefs>().init();
    runApp(await builder());
  } catch (e) {
    log(e.toString(), name: 'bootstrap');
    // await FirebaseCrashlytics.instance.recordError(e, s, fatal: true);
  }
}
