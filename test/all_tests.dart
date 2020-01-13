import 'package:flutter_test/flutter_test.dart';

import './main_dev_test.dart' as mainDev;
import './main_prod_test.dart' as mainStaging;
import './main_staging_test.dart' as mainProd;

void main() async {
  group('Main with flavors', () {
    mainDev.main();
    mainStaging.main();
    mainProd.main();
  });
}
