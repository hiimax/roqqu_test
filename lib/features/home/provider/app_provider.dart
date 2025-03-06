import 'package:roqqu/core/utils/import.dart';

class ThemeProvider extends ChangeNotifier {
  bool _lightTheme = true;
  bool get lightTheme => _lightTheme;

  void setLightTheme(bool value) {
    _lightTheme = value;
    notifyListeners();
  }
}
