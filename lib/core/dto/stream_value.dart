import 'package:roqqu/features/home/models/symbols_model.dart';

class StreamValue {
  StreamValue({
    required this.symbol,
    required this.interval,
  });
  late Symbols symbol;
  late String? interval;
}
