import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:roqqu/core/utils/import.dart';
import 'package:roqqu/core/utils/spacer.dart';
import 'package:roqqu/core/widgets/app_button.dart';
import 'package:roqqu/core/widgets/app_checkbox.dart';
import 'package:roqqu/core/widgets/app_textfield.dart';
import 'package:roqqu/core/widgets/app_textstyle.dart';
import 'package:roqqu/core/widgets/app_toggle.dart';
import 'package:roqqu/features/home/provider/app_provider.dart';
import 'package:roqqu/resources/colors.dart';

class ActionBottomSheet extends HookWidget {
  ActionBottomSheet({super.key});

  final List<String> options = [
    'Limit',
    'Market',
    'Stop-Limit',
  ];

  @override
  Widget build(BuildContext context) {
    final selectedValue = useState(0);
    final selectedOption = useState('Limit');
    final _themeNotifier = context.watch<ThemeProvider>().lightTheme;
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 34, 14, 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppToggle(
              tabTexts: const [
                'Buy',
                'Sell',
              ],
              callback: (index) {},
            ),
            const YMargin(18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...options.map(
                  (e) => InkWell(
                    onTap: () {
                      selectedOption.value = e;
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 3,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 7,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: selectedOption.value == e
                            ? _themeNotifier
                                ? const Color(0xff555C63)
                                : const Color(0xffCFD3D8)
                            : Colors.transparent,
                      ),
                      child: Center(
                        child: SecondaryText(
                          text: e,
                          textSize: 14,
                          foreground: _themeNotifier
                              ? AppColors.black
                              : AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const YMargin(16),
            InputField(
              hintText: 'Limit price',
              suffixText: '0.00 USD',
              controller: TextEditingController(),
            ),
            const YMargin(16),
            InputField(
              hintText: 'Amount',
              suffixText: '0.00 USD',
              controller: TextEditingController(),
            ),
            const YMargin(16),
            InputField(
              isReadOnly: true,
              hintText: 'Type',
              suffixText: 'Good till cancelled',
              controller: TextEditingController(),
            ),
            const YMargin(16),
            CustomCheckbox(
              value: true,
              onSwitch: (val) {},
              text: const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    SecondaryText(
                      text: 'Post Only',
                    ),
                    YMargin(6),
                    Icon(
                      Icons.info_outline_rounded,
                      size: 14,
                    ),
                  ],
                ),
              ),
            ),
            const YMargin(16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SecondaryText(
                  text: 'Total',
                  textSize: 12,
                  foreground: AppColors.lightGrey,
                ),
                SecondaryText(
                  text: '0.00',
                  textSize: 12,
                  foreground: AppColors.lightGrey,
                ),
              ],
            ),
            const YMargin(16),
            SizedBox(
              width: double.infinity,
              child: DefaultGradientButton(
                title: 'Buy BTC',
                onPressed: () {},
              ),
            ),
            const YMargin(15),
            Divider(
              color: AppColors.lightGrey.withOpacity(.1),
              thickness: 1,
            ),
            const YMargin(15),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SecondaryText(
                  text: 'Total account value',
                  textSize: 12,
                  foreground: AppColors.lightGrey,
                ),
                Row(
                  children: [
                    SecondaryText(
                      text: 'NGN',
                      textSize: 12,
                      foreground: AppColors.lightGrey,
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 14,
                      color: AppColors.lightGrey,
                    ),
                  ],
                ),
              ],
            ),
            const YMargin(8),
            const SecondaryText(
              text: '0.00',
              textSize: 14,
              fontWeight: FontWeight.w600,
            ),
            const YMargin(16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SecondaryText(
                  text: 'Open Orders',
                  textSize: 12,
                  foreground: AppColors.lightGrey,
                ),
                SecondaryText(
                  text: 'Available',
                  textSize: 12,
                  foreground: AppColors.lightGrey,
                ),
              ],
            ),
            const YMargin(8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SecondaryText(
                  text: '0.00',
                  textSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                SecondaryText(
                  text: '0.00',
                  textSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            const YMargin(32),
            DefaultButton(
              title: 'Deposit',
              onPressed: () {},
              color: const Color(0xff2764FF),
            ),
          ],
        ),
      ),
    );
  }
}
