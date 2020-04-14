import 'package:intl/intl.dart';

import '../base/locator.dart';

class Utils {
  final formatter = new NumberFormat('#,##,##,###');

  String getFormatted(int stat) {
    return formatter.format(stat);
  }
}

String performFormatting(int stat) {
  return locator<Utils>().getFormatted(stat);
}
