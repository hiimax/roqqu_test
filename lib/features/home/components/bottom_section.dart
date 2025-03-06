import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:roqqu/core/utils/import.dart';
import 'package:roqqu/core/utils/spacer.dart';
import 'package:roqqu/core/widgets/app_box.dart';
import 'package:roqqu/core/widgets/app_toggle.dart';
import 'package:roqqu/resources/colors.dart';

class BottomSection extends HookWidget {
  const BottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    final balance = useState<double>(20634);
    return AppBox(
      child: Column(
        children: [
          AppToggle(
            tabTexts: const ['Open Orders', 'Positions', 'Order'],
            callback: (index) {},
          ),
          YMargin(128),
          Text(
            'No Open Orders',
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
    );
  }
}
