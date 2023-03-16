import 'package:flutter/material.dart';

class ClimaPage extends StatelessWidget {
  const ClimaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clima'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [Text('Clima')],
      ),
    );
  }
}
