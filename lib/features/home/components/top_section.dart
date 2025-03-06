import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:roqqu/core/utils/app_utils.dart';
import 'package:roqqu/core/utils/import.dart';
import 'package:roqqu/core/utils/spacer.dart';
import 'package:roqqu/core/widgets/app_box.dart';
import 'package:roqqu/features/home/provider/socket_provider.dart';
import 'package:roqqu/resources/colors.dart';
import 'package:roqqu/resources/resources.dart';

class TopSection extends HookWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    final balance = useState<double>(20634);
    final provider = context.watch<SocketProvider>();
    return AppBox(
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                SvgIcons.coin,
              ),
              XMargin(8),
              Text(
                provider.currentSymbols.symbol,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              XMargin(16),
              SvgPicture.asset(
                SvgIcons.arrowDown,
              ),
              XMargin(16),
              Text(
                provider.candleTicker != null
                    ? AppUtils.formatCurrency(
                        provider.candleTicker!.candle.close.toDouble(),
                        currency: '\$',
                      )
                    : '',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.lightGreen,
                    ),
              ),
            ],
          ),
          YMargin(14),
          Row(
            children: [
              Expanded(
                flex: 10,
                child: _buildRow(
                  context,
                  image: SvgIcons.clock,
                  title: 'change',
                  value: provider.candleTicker != null
                      ? AppUtils.formatCurrency(
                          provider.candleTicker!.candle.close.toDouble(),
                        )
                      : '',
                  percentage: '1.25',
                ),
              ),
              XMargin(12),
              SvgPicture.asset(
                SvgIcons.divider,
              ),
              XMargin(12),
              Expanded(
                flex: 10,
                child: _buildRow(
                  context,
                  image: SvgIcons.clock,
                  title: 'high',
                  value: provider.candleTicker != null
                      ? AppUtils.formatCurrency(
                          provider.candleTicker!.candle.high.toDouble(),
                        )
                      : '',
                  percentage: '1.25',
                ),
              ),
              XMargin(12),
              SvgPicture.asset(
                SvgIcons.divider,
              ),
              XMargin(12),
              Expanded(
                flex: 10,
                child: _buildRow(
                  context,
                  image: SvgIcons.clock,
                  title: 'low',
                  value: provider.candleTicker != null
                      ? AppUtils.formatCurrency(
                          provider.candleTicker!.candle.low.toDouble(),
                        )
                      : '',
                  percentage: '1.25',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildRow(
    context, {
    required String title,
    required String value,
    required String image,
    required String percentage,
  }) {
    final _theme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              image,
            ),
            XMargin(4),
            Text(
              '24h $title',
              style: _theme.bodySmall,
            ),
          ],
        ),
        YMargin(4),
        RichText(
            text: TextSpan(children: [
          TextSpan(
            text: value,
            style: _theme.bodyMedium!.copyWith(
              color: AppColors.lightGreen,
            ),
          ),
          TextSpan(
            text: ' +',
            style: _theme.bodyMedium!.copyWith(
              color: AppColors.lightGreen,
            ),
          ),
          TextSpan(
            text: '${percentage}%',
            style: _theme.bodyMedium!.copyWith(
              color: AppColors.lightGreen,
            ),
          ),
        ])),
      ],
    );
  }
}
