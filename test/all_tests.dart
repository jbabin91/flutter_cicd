import 'package:flutter_test/flutter_test.dart';

import './main_dev_test.dart' as main_dev;
import './main_prod_test.dart' as main_staging;
import './main_staging_test.dart' as main_prod;

void main() async {
  group('Main with flavors', () {
    main_dev.main();
    main_staging.main();
    main_prod.main();
  });
}
