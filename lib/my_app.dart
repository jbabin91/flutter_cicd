import 'package:flutter/material.dart';

import './environments/widgets/env.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the environment context
    Env envContext = Env.of(context);

    return MaterialApp(
      title: envContext.env.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(envContext.env.appTitle),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'This app is a test of a ci/cd pipeline.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
