// ignore_for_file: invalid_use_of_protected_member

import 'package:candlesticks/candlesticks.dart';
import 'package:roqqu/app/service_locator.dart';
import 'package:roqqu/core/dto/stream_value.dart';
import 'package:roqqu/core/utils/import.dart';
import 'package:roqqu/features/home/models/candle_ticker_model.dart';
import 'package:roqqu/features/home/models/order_book_model.dart';
import 'package:roqqu/features/home/models/symbols_model.dart';
import 'package:roqqu/features/home/repository/binance_repository.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class SocketProvider extends ChangeNotifier {
  static SocketProvider? _instance;
  SocketProvider() {
    _binanceRepository = locator.get<BinanceRepository>();
  }

  static SocketProvider get instance {
    _instance ??= SocketProvider();
    return _instance!;
  }

  late final BinanceRepository _binanceRepository;
  StreamValue? _streamValue;

  StreamValue? get streamValue => _streamValue;

  WebSocketChannel? _channel;

  

  List<Symbols> _symbols = [];
  List<Symbols> get symbols => _symbols;

  Symbols _currentSymbols = Symbols.empty();
  Symbols get currentSymbols => _currentSymbols;

  List<Candle> _candles = [];
  List<Candle> get candles => _candles;

  OrderBookModel? _orderBook;
  OrderBookModel? get orderBook => _orderBook;
  CandleTickerModel? _candleTicker;
  CandleTickerModel? get candleTicker => _candleTicker;

  void startConnection(StreamValue streamValue) {
    _streamValue = streamValue;

    _channel = _binanceRepository.establishConnection(
      streamValue.symbol.symbol.toLowerCase(),
      streamValue.interval ?? '1h',
    );

    _channel!.stream.listen((message) {
      final map = jsonDecode(message) as Map<String, dynamic>;
      final eventType = map['e'];

      if (eventType == 'kline') {
        final candleTicker = CandleTickerModel.fromJson(map);
        _candleTicker = candleTicker;

        if (_candles.isNotEmpty &&
            _candles[0].date == candleTicker.candle.date &&
            _candles[0].open == candleTicker.candle.open) {
          _candles[0] = candleTicker.candle;
        } else if (_candles.length > 1 &&
            candleTicker.candle.date.difference(_candles[0].date) ==
                _candles[0].date.difference(_candles[1].date)) {
          _candles.insert(0, candleTicker.candle);
        }

        notifyListeners();
      } else if (eventType == 'depthUpdate') {
        _orderBook = OrderBookModel.fromJson(map);
        notifyListeners();
      }
    });
  }

  Future<void> getCandles(StreamValue streamValue) async {
    try {
     
      final data = await _binanceRepository.fetchCandles(
        symbol: streamValue.symbol.symbol,
        interval: streamValue.interval!,
      );

      
      _candles = data;
    } catch (e) {
      print(e);
    } finally {
      notifyListeners();
    }
  }

  Future<void> loadMoreCandles(StreamValue streamValue) async {
    try {
      final data = await _binanceRepository.fetchCandles(
        symbol: streamValue.symbol.symbol,
        interval: streamValue.interval!,
        endTime: _candles.last.date.millisecondsSinceEpoch,
      );

      _candles
        ..removeLast()
        ..addAll(data);
    } catch (e) {
      print(e);
    } finally {
      notifyListeners();
    }
  }


  Future<void> getSymbols() async {
    try {
      final data = await _binanceRepository.fetchSymbols();

      _symbols = data;
      _currentSymbols = _symbols[11];
      getCandles(StreamValue(
        interval: '1h',
        symbol: _currentSymbols,
      ));
      startConnection(
        StreamValue(
          interval: '1h',
          symbol: _currentSymbols,
        ),
      );
    } catch (e) {
      _symbols = [];
    } finally {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _channel?.sink.close();
    super.dispose();
  }
}
