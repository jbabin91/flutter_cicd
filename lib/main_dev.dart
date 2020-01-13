import 'package:flutter/material.dart';

import './environments/dev.dart';
import './environments/widgets/env.dart';
import './my_app.dart';

void main() => runApp(app);

var app = Env(
  DevEnv(),
  child: MyApp(),
);
