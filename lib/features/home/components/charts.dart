import 'package:candlesticks/candlesticks.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:roqqu/core/dto/stream_value.dart';
import 'package:roqqu/core/utils/app_utils.dart';
import 'package:roqqu/core/utils/import.dart';
import 'package:roqqu/core/utils/spacer.dart';
import 'package:roqqu/core/widgets/app_textstyle.dart';
import 'package:roqqu/features/home/enums/candlestick.dart';
import 'package:roqqu/features/home/provider/socket_provider.dart';
import 'package:roqqu/resources/colors.dart';
import 'package:roqqu/resources/resources.dart';

class Chart extends HookWidget {
  const Chart({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState<int>(0);
    final isTradingView = useState(true);
    final currentTime = useState<String>(CandlestickValue.oneHour.title);
    final provider = context.watch<SocketProvider>();
    // final currentSymbol = context.watch();
    // final candlestick = context.watch();
    return Column(
      children: [
        SizedBox(
          height: 35,
          child: Row(
            children: [
              Text(
                'Time',
                style: TextStyle(
                  color: AppColors.lightGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              XMargin(10),
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: CandlestickValue.values.length,
                  separatorBuilder: (context, index) => XMargin(8),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        selectedIndex.value = index;
                        currentTime.value =
                            CandlestickValue.values[index].title;
                        provider.getCandles(
                          StreamValue(
                            symbol: provider.currentSymbols,
                            interval: currentTime.value.toLowerCase(),
                          ),
                        );
                      },
                      child: Container(
                        width: 40,
                        decoration: BoxDecoration(
                          color: selectedIndex.value == index
                              ? AppColors.border
                              : AppColors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: CandlestickValue.values[index].icon,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 0.3,
          color: AppColors.divider,
        ),
        YMargin(20),
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: Candlesticks(
              key: Key(provider.currentSymbols.toString() + currentTime.value),
              candles: provider.candles,
              onLoadMoreCandles: () {
                return provider.loadMoreCandles(
                  StreamValue(
                    symbol: provider.currentSymbols,
                    interval: currentTime.value.toLowerCase(),
                  ),
                );
              },
              actions: [
                ToolBarAction(
                  width: 20,
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: SvgPicture.asset(SvgIcons.arrowDown),
                  ),
                ),
                ToolBarAction(
                  width: 55,
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(left: 2),
                    child: SecondaryText(
                      text: provider.currentSymbols.symbol,
                      textSize: 11,
                      foreground: AppColors.lightGrey,
                    ),
                  ),
                ),
                if (provider.candleTicker != null)
                  ToolBarAction(
                    width: 55,
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: Row(
                        children: [
                          const Expanded(
                            child: SecondaryText(
                              text: 'O',
                              textSize: 11,
                              foreground: AppColors.lightGrey,
                            ),
                          ),
                          SecondaryText(
                            text: AppUtils.formatCurrency(
                              provider.candleTicker!.candle.open.toDouble(),
                            ),
                            textSize: 10,
                            foreground: AppColors.lightGreen,
                          ),
                        ],
                      ),
                    ),
                  ),
                if (provider.candleTicker != null)
                  ToolBarAction(
                    width: 55,
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: Row(
                        children: [
                          const SecondaryText(
                            text: 'H ',
                            textSize: 11,
                            foreground: AppColors.lightGrey,
                          ),
                          SecondaryText(
                            text: AppUtils.formatCurrency(
                              provider.candleTicker!.candle.high.toDouble(),
                            ),
                            textSize: 11,
                            foreground: AppColors.lightGreen,
                          ),
                        ],
                      ),
                    ),
                  ),
                if (provider.candleTicker != null)
                  ToolBarAction(
                    width: 55,
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: Row(
                        children: [
                          const SecondaryText(
                            text: 'L ',
                            textSize: 11,
                            foreground: AppColors.lightGrey,
                          ),
                          SecondaryText(
                            text: AppUtils.formatCurrency(
                              provider.candleTicker!.candle.low.toDouble(),
                            ),
                            textSize: 11,
                            foreground: AppColors.lightGreen,
                          ),
                        ],
                      ),
                    ),
                  ),
                if (provider.candleTicker != null)
                  ToolBarAction(
                    width: 55,
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: Row(
                        children: [
                          const Expanded(
                            child: SecondaryText(
                              text: 'C ',
                              textSize: 11,
                              foreground: AppColors.lightGrey,
                            ),
                          ),
                          SecondaryText(
                            text: AppUtils.formatCurrency(
                              provider.candleTicker!.candle.close.toDouble(),
                            ),
                            textSize: 10,
                            foreground: AppColors.lightGreen,
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
