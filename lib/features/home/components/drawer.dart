import 'package:roqqu/core/utils/import.dart';
import 'package:roqqu/core/widgets/app_textstyle.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Stack(
        children: [
          Positioned(
            top: 65,
            right: 10,
            child: Container(
              height: 208,
              width: 214,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Theme.of(context).shadowColor,
                  width: 1.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ..._drawerItems.map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 13,
                      ),
                      child: SecondaryText(
                        text: e,
                        textSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
  }
}

final _drawerItems = [
    'Exchange',
    'Wallets',
    'Roqqu Hub',
    'Log out',
  ];