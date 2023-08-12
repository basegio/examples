import 'package:flutter/material.dart';
import 'package:mestredns/modules/dropdown/dropdown_page.dart';
import 'package:mestredns/modules/home/home_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      '/': (context) => const HomePage(),
      '/dropdown': (context) => const DropdownPage(),
    });
  }
}
