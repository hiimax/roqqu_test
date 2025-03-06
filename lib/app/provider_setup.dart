import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:roqqu/core/dto/stream_value.dart';
import 'package:roqqu/features/home/models/symbols_model.dart';
import 'package:roqqu/features/home/provider/app_provider.dart';
import 'package:roqqu/features/home/provider/socket_provider.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ChangeNotifierProvider(
    create: (_) => SocketProvider()
      
      ..getSymbols()
      ,
  ),
  ChangeNotifierProvider(create: (_) => ThemeProvider()),
  ...uiConsumableProviders
];

List<SingleChildWidget> independentServices = [];

List<SingleChildWidget> dependentServices = [];

// Place All ChangeNotifierProvider's separated by a comma ","

List<SingleChildWidget> uiConsumableProviders = [];
