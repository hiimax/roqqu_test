import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:roqqu/resources/resources.dart';

void main() {
  test('svg_icons assets test', () {
    expect(File(SvgIcons.arrowC).existsSync(), isTrue);
    expect(File(SvgIcons.arrowDown).existsSync(), isTrue);
    expect(File(SvgIcons.arrowDownD).existsSync(), isTrue);
    expect(File(SvgIcons.arrowUp).existsSync(), isTrue);
    expect(File(SvgIcons.avatar).existsSync(), isTrue);
    expect(File(SvgIcons.buyL).existsSync(), isTrue);
    expect(File(SvgIcons.chartD).existsSync(), isTrue);
    expect(File(SvgIcons.clock).existsSync(), isTrue);
    expect(File(SvgIcons.coin).existsSync(), isTrue);
    expect(File(SvgIcons.darkLogo).existsSync(), isTrue);
    expect(File(SvgIcons.divider).existsSync(), isTrue);
    expect(File(SvgIcons.globe).existsSync(), isTrue);
    expect(File(SvgIcons.greednD).existsSync(), isTrue);
    expect(File(SvgIcons.greenDe).existsSync(), isTrue);
    expect(File(SvgIcons.menu).existsSync(), isTrue);
    expect(File(SvgIcons.noGreen).existsSync(), isTrue);
    expect(File(SvgIcons.whiteLogo).existsSync(), isTrue);
  });
}
