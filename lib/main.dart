// Next to learn:

// (80%) Text
// (80%) Icon
// (80%) CircleAvatar
// (40%) Scaffold
// -----------
// (60%) Container
// (60%) Column
// (60%) Row
// (60%) Padding
// SizedBox
// Divider
// (Pending) Expanded   !!!
// AppBar
// -----------
// (50%) StatefulWidget
// (90%) Inkwell
// (90%) GestureDetector
// How to make sure it's responsive?
// -----------
// (60%) Popup menu
// (20%) Dropdown button
// (20%) Dropdown button form field
// DropdownButton2
// -----------

// !!! Add exercises to make it more interactive
// !!!!!!!! OMG I CAN MAKE THE ROAD TO MAKE A COMPLICATED COMPONENT LIKE
// !!!!!!!! SENKU'S ROADMAP!!!

import 'package:flutter/material.dart';
import 'package:learning_flutter/pages/l01_scaffold_page.dart';
import 'package:learning_flutter/pages/l02_text_page.dart';
import 'package:learning_flutter/pages/l03_layout_widgets_page.dart';
import 'package:learning_flutter/pages/l04_stateful_widgets_inkwell_gesture_detector.dart';
import 'package:learning_flutter/pages/l05_dropdown_menu_page.dart';
import 'pages/example_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Aprendizaje Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mi Aprendizaje Flutter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // -----------------------------------------------------------------
            // 1. Scaffold Page
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ScaffoldPage()),
              ),
              child: const Text('1. Scaffold Page'),
            ),
            const SizedBox(height: 20),
            // -----------------------------------------------------------------
            // 2. Text Page
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TextPage()),
              ),
              child: const Text('2. Text Page'),
            ),
            const SizedBox(height: 20),
            // -----------------------------------------------------------------
            // 3. Layout Widgets Page
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LayoutWidgetsPage(),
                ),
              ),
              child: const Text('3. Layout Widgets (Row, Column, ...)'),
            ),
            const SizedBox(height: 20),
            // -----------------------------------------------------------------
            // 4. Stateful Widgets, Inkwell, GestureDetector
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StfwInkwellGestureDetectorPage(),
                ),
              ),
              child: const Text(
                '4. Stateful Widgets, Inkwell, GestureDetector',
              ),
            ),
            const SizedBox(height: 20),
            // -----------------------------------------------------------------
            // 5. Dropdown menu
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DropdownMenuPage(),
                ),
              ),
              child: const Text('5. Dropdown menu'),
            ),
            const SizedBox(height: 20),
            // -----------------------------------------------------------------
            // #.
          ],
        ),
      ),
    );
  }
}
