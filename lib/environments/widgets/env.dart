import 'package:flutter/material.dart';

import '../env_interface.dart';

class Env extends InheritedWidget {
  final EnvInterface _env;

  const Env(
    this._env, {
    Key key,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  EnvInterface get env => _env;

  @override
  bool updateShouldNotify(Env old) => false;

  static Env of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType() as Env;
  }
}
