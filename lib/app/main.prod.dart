import 'dart:async';

import 'package:roqqu/app/app.dart';
import 'package:roqqu/app/bootstrap.dart';
import 'package:roqqu/env/env.dart';

void main() async {
  // await setupLocator(environment: AppEnvironment.dev);
  unawaited(
    bootstrap(
      () => const Roqqu(),
      environment: AppEnvironment.dev,
    ),
  );
}
