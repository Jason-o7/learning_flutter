import 'dart:async';

import 'package:flutter/material.dart';

class StfwInkwellGestureDetectorPage extends StatefulWidget {
  const StfwInkwellGestureDetectorPage({super.key});

  @override
  State<StfwInkwellGestureDetectorPage> createState() =>
      _StfwInkwellGestureDetectorPageState();
}

class _StfwInkwellGestureDetectorPageState
    extends State<StfwInkwellGestureDetectorPage> {
  // -------------------------------------------------------------------------
  // B E G G I N I N G
  // -------------------------------------------------------------------------
  // Here we can define any state variables that can change over time and affect the UI.
  // 1. Simple variable states
  int _counter = 0;
  bool _isLiked = false;
  String _message = '';
  // We can also have list variable states and more

  // This variables will help us to understand the lifecycle better.
  String _lifecycleStatus = 'not initialized Widget';
  int _buildCount =
      0; // Variable to count how many times the widget has been built.
  Timer? _timer;

  // Stateful widgets also has some common methods that we can override:
  // 1. initState - it gets executed only once before "build"
  // it is common to initialize variables, controllers, or start streams here.
  @override
  void initState() {
    super.initState();

    // initializing states
    _counter = 12;
    _isLiked = true;
    _message = 'Me quiero morir';
    _lifecycleStatus = 'initialized Widget in initState()';

    // This is a simple timer that will increment the counter every 2 seconds.
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (mounted) {
        // Verificar que el widget aún existe
        setState(() {
          _counter++;
        });
      }
    });
  }

  @override
  void dispose() {
    // This method is called when the widget is removed from the widget tree.
    // It is used to clean up resources, like controllers or streams.
    _timer?.cancel();
    super.dispose(); // Always call super.dispose() at the end.
  }

  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  // We always have this on stateful or stateless widgets, it's to build the UI.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful Widgets, Inkwell, GestureDetector'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -----------------------------------------------------------------
            // 1. Stateful Widget
            // -----------------------------------------------------------------
            const Text(
              '1. Stateful Widget',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 12),

            // A elevated button widget that displays the current value of the counter.
            // The text will update every time the state changes.
            ElevatedButton(
              // onPressed!!!
              onPressed: () {
                setState(() {
                  _counter++;
                });
              },
              child: Text('Increment Counter: $_counter'),
            ),

            // Heart icon that will change state when pressed and evertime the
            // state changes, the widget will rebuild. Depending on the state,
            // the icon will be red (liked) or grey (not liked).
            IconButton(
              icon: Icon(
                _isLiked ? Icons.favorite : Icons.favorite_border,
                color: _isLiked ? Colors.red : null,
              ),
              // onPressed!!!
              onPressed: () {
                setState(() {
                  _isLiked = !_isLiked;
                });
              },
            ),
            const SizedBox(height: 20),
            // A text widget that displays the timer
            Text('⏱️ Timer: $_counter'),
            const SizedBox(height: 20),

            // -----------------------------------------------------------------
            // 2. Inkwell and GestureDetector
            // -----------------------------------------------------------------
            // 2.1 Inkwell: A widget that responds to touch events and provides a ripple effect.
            // Do not use color: Colors... because it will not show the ripple effect
            // when pressed.
            // Instead, use decoration: BoxDecoration(color: Colors...) with a transparent
            // color to see the ripple effect.
            const Text(
              '2. Inkwell and GestureDetector',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 12),
            InkWell(
              onTap: () {
                setState(() {
                  _message += '|';
                });
              },
              child: Container(
                padding: const EdgeInsets.all(16.0),
                // color: Colors.lightBlueAccent,
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent.withValues(
                    alpha: 0.3,
                  ), // Semi-transparente
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(_message),
              ),
            ),
            const SizedBox(height: 20),
            // 2.2 GestureDetector: A widget that detects gestures like taps, drags, and more.
            GestureDetector(
              onTap: () {
                setState(() {
                  _message += '-';
                });
              },
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(
                    255,
                    64,
                    255,
                    93,
                  ).withValues(alpha: 0.3), // Semi-transparente
                  border: Border.all(
                    color: const Color.fromARGB(255, 33, 243, 124),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(_message),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
