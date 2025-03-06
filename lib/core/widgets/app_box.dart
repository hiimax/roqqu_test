import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:roqqu/core/utils/import.dart';

class AppBox extends HookWidget {
  const AppBox({
    super.key,
    required this.child,
    this.padding,
  });
  final Widget child;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding ?? EdgeInsets.symmetric(horizontal: 13, vertical: 11),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
      ),
      child: child,
    );
  }
}
