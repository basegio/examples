import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final examples = const {
    'Dropdown Example': '/dropdown',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MestreDNS Examples'),
        ),
        body: ListView(
          children: examples.entries
              .map(
                (entry) => InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      entry.key,
                      style: const TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  onTap: () => Navigator.pushNamed(context, entry.value),
                ),
              )
              .toList(),
        ));
  }
}
