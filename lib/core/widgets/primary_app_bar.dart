import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roqqu/core/utils/spacer.dart';
import 'package:roqqu/resources/resources.dart';

class RoqquAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final VoidCallback? onFilterTap;
  final List<Widget>? customActions;
  final Widget? leading;
  final PreferredSizeWidget? bottom;
  final double? toolbarHeight;
  final bool centerTitle;
  final bool showLeading;

  const RoqquAppBar({
    super.key,
    required this.title,
    this.showLeading = false,
    this.onFilterTap,
    this.customActions,
    this.bottom,
    this.toolbarHeight,
    this.leading,
    this.centerTitle = false,
  });

  @override
  Size get preferredSize => Size.fromHeight(
        (toolbarHeight ?? 65) + (bottom?.preferredSize.height ?? 0),
      );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showLeading ? leading : null,
      centerTitle: centerTitle,
      title: title,
      actions: customActions ?? _buildDefaultActions(),
      bottom: bottom,
    );
  }

  List<Widget> _buildDefaultActions() {
    final List<Widget> actions = [];

    actions.addAll([
      SvgPicture.asset(
        SvgIcons.avatar,
      ),
      XMargin(16),
      SvgPicture.asset(
        SvgIcons.globe,
      ),
      XMargin(16),
      GestureDetector(
        onTap: onFilterTap,
        child: SvgPicture.asset(
          SvgIcons.menu,
        ),
      ),
      XMargin(16),
    ]);

    return actions;
  }
}
