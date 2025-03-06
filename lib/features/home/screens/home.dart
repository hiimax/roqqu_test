import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:roqqu/core/utils/import.dart';
import 'package:roqqu/core/utils/spacer.dart';
import 'package:roqqu/core/widgets/app_box.dart';
import 'package:roqqu/core/widgets/app_button.dart';
import 'package:roqqu/core/widgets/primary_app_bar.dart';
import 'package:roqqu/features/home/components/bottom_section.dart';
import 'package:roqqu/features/home/components/bottom_sheet.dart';
import 'package:roqqu/features/home/components/chart_section.dart';
import 'package:roqqu/features/home/components/drawer.dart';
import 'package:roqqu/features/home/components/top_section.dart';
import 'package:roqqu/features/home/provider/app_provider.dart';
import 'package:roqqu/resources/resources.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _themeNotifier = context.watch<ThemeProvider>().lightTheme;
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      endDrawer: DrawerWidget(),
      appBar: RoqquAppBar(
        onFilterTap: () {
          scaffoldKey.currentState?.openEndDrawer();
        },
        title: SvgPicture.asset(
          _themeNotifier ? SvgIcons.darkLogo : SvgIcons.whiteLogo,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            YMargin(8),
            TopSection(),
            YMargin(8),
            ChartSection(),
            YMargin(8),
            BottomSection(),
            YMargin(8),
          ],
        ),
      ),
      bottomNavigationBar: AppBox(
          child: Row(
        children: [
          Expanded(
            flex: 10,
            child: AppButton.buy(
              title: 'Buy',
              onPressed: () {
                showModalBottomSheet<dynamic>(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext buildContext) {
                    return ActionBottomSheet();
                  },
                );
              },
            ),
          ),
          Expanded(
            flex: 10,
            child: AppButton.sell(
              title: 'Sell',
              onPressed: () {
                showModalBottomSheet<dynamic>(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext buildContext) {
                    return ActionBottomSheet();
                  },
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
