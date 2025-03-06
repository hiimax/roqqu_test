import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:roqqu/core/utils/import.dart';
import 'package:roqqu/core/utils/spacer.dart';
import 'package:roqqu/core/widgets/app_box.dart';
import 'package:roqqu/core/widgets/app_toggle.dart';
import 'package:roqqu/features/home/components/charts.dart';
import 'package:roqqu/features/home/components/orderbook.dart';
import 'package:roqqu/resources/colors.dart';

class ChartSection extends HookWidget {
  const ChartSection({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState<int>(0);
    return AppBox(
      child: Column(
        children: [
          AppToggle(
            tabTexts: const ['Charts', 'Orderbook', 'Recent trades'],
            callback: (index) {
              selectedIndex.value = index;
            },
          ),
          YMargin(18),
          SizedBox(
            child: switch (selectedIndex.value) {
              0 => SizedBox(height: 400, child: Chart()),
              1 => Orderbook(),
              _ => Column(
                  children: [
                    YMargin(128),
                    Text(
                      'No Recent Trades',
                      style: Theme.of(context).textTheme.bodyLarge!,
                    ),
                    YMargin(8),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id pulvinar nullam sit imperdiet pulvinar.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.lightGrey,
                          ),
                    ),
                    YMargin(54),
                  ],
                ),
            },
          )
        ],
      ),
    );
  }
}
