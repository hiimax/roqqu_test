import 'package:roqqu/core/utils/import.dart';
import 'package:roqqu/features/home/provider/app_provider.dart';
import 'package:roqqu/resources/colors.dart';

class AppToggle extends StatefulWidget {
  final Function(int) callback;
  final List<String> tabTexts;
  final int initialIndex;

  const AppToggle({
    Key? key,
    required this.callback,
    required this.tabTexts,
    this.initialIndex = 0,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppToggleState();
}

class _AppToggleState extends State<AppToggle> {
  late int index;

  _AppToggleState() : super();

  @override
  void initState() {
    super.initState();

    index = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width - 38;
    final _theme = Theme.of(context);
    final _themeNotifier = context.watch<ThemeProvider>().lightTheme;
    return Container(
      height: 40,
      width: width,
      decoration: BoxDecoration(
        color: _theme.canvasColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: _theme.shadowColor, width: 1),
      ),
      child: Stack(children: [
        AnimatedAlign(
          alignment: Alignment(
              (index / (widget.tabTexts.length - 1) * (2 - 2 * 0)) - 1 + 0, 0),
          duration: Duration(milliseconds: 150),
          child: Container(
            width: (width / widget.tabTexts.length),
            height: 40 * 0.9,
            decoration: BoxDecoration(
              boxShadow: _themeNotifier
                  ? [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.04),
                        spreadRadius: 0,
                        blurRadius: 1,
                        offset: const Offset(0, 3),
                      ),
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.25),
                        spreadRadius: 0,
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ]
                  : [],
              color: _themeNotifier
                  ? AppColors.white
                  : AppColors.darkGrey.withOpacity(0.05),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (int i = 0; i < widget.tabTexts.length; i++)
              _buildSwitchTab(
                i == index,
                widget.tabTexts[i],
                _theme.textTheme.bodyMedium!,
                i,
              ),
          ],
        ),
      ]),
    );
  }

  /// building and returning one item of the tab
  Widget _buildSwitchTab(
    bool isLeft,
    String title,
    TextStyle style,
    int i,
  ) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        setState(() {
          index = i;
          widget.callback(i);
        });
      },
      child: Container(
          alignment: Alignment.center,
          width:
              (MediaQuery.of(context).size.width - 46) / widget.tabTexts.length,
          height: 40,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: style,
          )),
    );
  }
}
