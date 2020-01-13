import 'package:flutter/material.dart';

import './environments/staging.dart';
import './environments/widgets/env.dart';
import './my_app.dart';

void main() => runApp(app);

var app = Env(
  StagingEnv(),
  child: MyApp(),
);
