import 'package:get_it/get_it.dart';
import 'package:roqqu/core/storage/cache_storage.dart';
import 'package:roqqu/env/env.dart';
import 'package:roqqu/features/home/repository/binance_repository.dart';

// import 'package:twilio_flutter/twilio_flutter.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator({
  required AppEnvironment environment,
}) async {
  locator
    ..registerLazySingleton<AppEnvironment>(() => environment)
    ..registerLazySingleton<SharedPrefs>(SharedPrefs.new)
    ..registerLazySingleton<BinanceRepository>(BinanceRepository.new);
  
}
