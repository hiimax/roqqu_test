import 'package:roqqu/app/service_locator.dart';
import 'package:roqqu/env/development.dart';
import 'package:roqqu/env/env_fields.dart';
import 'package:roqqu/env/production.dart';
import 'package:roqqu/env/staging.dart';

enum AppEnvironment { dev, staging, prod }

abstract interface class Env implements EnvFields {
  factory Env() => _instance;

  static final Env _instance = switch (locator<AppEnvironment>()) {
    AppEnvironment.dev => DevEnv(),
    AppEnvironment.staging => QaEnv(),
    AppEnvironment.prod => ProdEnv(),
  };
}
