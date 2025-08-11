import 'package:flutter/material.dart';

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    // -------------------------------------------------------------------------
    // B E G G I N I N G
    // -------------------------------------------------------------------------
    //
    return Scaffold(
      appBar: AppBar(title: const Text('Example Page')),
      body: const Center(child: Text('Página de ejemplo')),
    );
  }
}
