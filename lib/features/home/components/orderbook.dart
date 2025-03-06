import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:roqqu/core/utils/app_utils.dart';
import 'package:roqqu/core/utils/import.dart';
import 'package:roqqu/core/utils/spacer.dart';
import 'package:roqqu/features/home/provider/socket_provider.dart';
import 'package:roqqu/resources/colors.dart';
import 'package:roqqu/resources/resources.dart';

class Orderbook extends HookWidget {
  const Orderbook({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState<int>(0);
    final provider = context.watch<SocketProvider>();
    return Column(
      children: [
        Row(
          children: [
            _buildToggle(
              callback: () {
                selectedIndex.value = 0;
              },
              active: selectedIndex.value == 0,
              icon: SvgIcons.greenDe,
            ),
            XMargin(4),
            _buildToggle(
              callback: () {
                selectedIndex.value = 1;
              },
              active: selectedIndex.value == 1,
              icon: SvgIcons.greednD,
            ),
            XMargin(4),
            _buildToggle(
              callback: () {
                selectedIndex.value = 2;
              },
              active: selectedIndex.value == 2,
              icon: SvgIcons.noGreen,
            ),
            Spacer(),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 63,
                height: 32,
                decoration: BoxDecoration(
                  color: AppColors.border,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '10',
                      style: TextStyle(
                        color: AppColors.lightGrey,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    XMargin(10),
                    SvgPicture.asset(
                      SvgIcons.arrowDown,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        YMargin(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 10,
              child: Text(
                'Price\n(USDT)',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: AppColors.lightGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Text(
                'Amounts\n(BTC)',
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: AppColors.lightGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Text(
                'Total',
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: AppColors.lightGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        Column(
          children: List.generate(
              provider.orderBook!.asks!.length > 5
                  ? 5
                  : provider.orderBook!.asks!.length, (ask) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      color: selectedIndex.value == 0
                          ? AppColors.lightGreen.withOpacity(0.2)
                          : AppColors.lightRed.withOpacity(0.2),
                      height: 24,
                      width: (double.tryParse(
                                  provider.orderBook!.asks![ask]![0])! *
                              double.tryParse(
                                  provider.orderBook!.asks![ask]![1])!) /
                          100,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildPrice(
                          value: AppUtils.formatString(
                            provider.orderBook!.asks![ask]![0].toString(),
                          ),
                          textColor: AppColors.sell),
                      _buildPrice(
                          value: AppUtils.formatString(
                            provider.orderBook!.asks![ask]![0].toString(),
                          ),
                          textColor: AppColors.lightStan),
                      _buildPrice(
                          value: AppUtils.formatString(
                              provider.orderBook!.asks![ask]![0].toString()),
                          textColor: AppColors.lightStan)
                    ],
                  ),
                ],
              ),
            );
          }),
        ),
        YMargin(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppUtils.formatString(
                provider.orderBook!.asks![1]![0]!.toString(),
              ),
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.lightGreen,
                    fontSize: 16,
                  ),
            ),
            XMargin(8),
            SvgPicture.asset(SvgIcons.buyL),
            XMargin(8),
            Text(
              AppUtils.formatString(
                provider.orderBook!.bids![1]![0]!.toString(),
              ),
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.lightStan,
                    fontSize: 16,
                  ),
            ),
          ],
        ),
        YMargin(16),
        Column(
          children: List.generate(
              provider.orderBook!.bids!.length > 5
                  ? 5
                  : provider.orderBook!.bids!.length, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      color: selectedIndex.value == 0
                          ? AppColors.lightGreen.withOpacity(0.2)
                          : AppColors.lightRed.withOpacity(0.2),
                      height: 24,
                      width: (double.tryParse(
                                  provider.orderBook!.bids![index]![0])! *
                              double.tryParse(
                                  provider.orderBook!.bids![index]![1])!) /
                          100,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildPrice(
                          value: AppUtils.formatString(
                            provider.orderBook!.bids![index]![0].toString(),
                          ),
                          textColor: AppColors.sell),
                      _buildPrice(
                          value: AppUtils.formatString(
                            provider.orderBook!.bids![index]![1].toString(),
                          ),
                          textColor: AppColors.lightStan),
                      _buildPrice(
                          value: AppUtils.formatString(
                            provider.orderBook!.bids![index]![0].toString(),
                          ),
                          textColor: AppColors.lightStan)
                    ],
                  ),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildToggle({
    required bool active,
    required VoidCallback callback,
    required String icon,
  }) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: active ? AppColors.border : AppColors.transparent,
        ),
        child: Center(
          child: SvgPicture.asset(
            icon,
          ),
        ),
      ),
    );
  }

  Widget _buildPrice({
    required String value,
    required Color textColor,
  }) {
    return Expanded(
      flex: 10,
      child: Text(
        value,
        textAlign: TextAlign.start,
        style: TextStyle(
          color: textColor,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
