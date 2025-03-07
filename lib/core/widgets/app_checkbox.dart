import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:roqqu/resources/colors.dart';


class CustomCheckbox extends HookWidget {
  const CustomCheckbox({
    required this.value,
    super.key,
    this.onSwitch,
    this.text,
  });
  final bool value;
  final Function(bool)? onSwitch;
  final Widget? text;

  @override
  Widget build(BuildContext context) {
    final isToggled = useState(value);
    return InkWell(
      onTap: () {
        isToggled.value = !isToggled.value;
        onSwitch!(isToggled.value);
      },
      child: Row(
        children: [
          AnimatedContainer(
            height: 17,
            width: 17,
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: isToggled.value
                  ? Theme.of(context).cardColor
                  : Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: AppColors.divider,
                width: 1.1,
              ),
            ),
            child: isToggled.value
                ? const Center(
                    child: Icon(
                      Icons.check_rounded,
                      size: 13,
                      color: AppColors.lightGrey,
                    ),
                  )
                : const SizedBox(),
          ),
          if (text != null) ...[text!],
        ],
      ),
    );
  }
}
