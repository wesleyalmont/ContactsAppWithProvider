import 'package:contactsprovider/screens/home.dart';
import 'package:contactsprovider/styles/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Contacts Provider",
      theme: myCustomTheme,
      home: Home(),
    );
  }
}
