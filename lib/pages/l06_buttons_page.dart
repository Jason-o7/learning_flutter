import 'package:flutter/material.dart';

class ButtonsPage extends StatefulWidget {
  const ButtonsPage({super.key});

  @override
  State<ButtonsPage> createState() => _ButtonsPageState();
}

class _ButtonsPageState extends State<ButtonsPage> {
  bool isLoading = false;
  bool isLoginLoading = false;

  @override
  Widget build(BuildContext context) {
    // -------------------------------------------------------------------------
    // B E G G I N I N G
    // -------------------------------------------------------------------------
    //
    return Scaffold(
      appBar: AppBar(title: const Text('Botones')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -------------------------------------------------------------------------
            // 1. ElevatedButton
            // -------------------------------------------------------------------------
            const Text(
              '1. Text (Widget)',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 1.1 Basic ElevatedButton
                ElevatedButton(
                  onPressed: () {
                    // ignore: avoid_print
                    print('Button pressed');
                  },
                  child: const Text('Press Me'),
                ),

                // 1.2 Basic ElevatedButton with Icon
                ElevatedButton.icon(
                  onPressed: () {
                    // ignore: avoid_print
                    print('Button with icon pressed');
                  },
                  icon: Icon(Icons.login),
                  label: Text('Login'),
                ),

                // 1.3 ElevatedButton with Style
                ElevatedButton(
                  onPressed: () {
                    // ignore: avoid_print
                    print('Styled button pressed');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Styled Button'),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // 1.4 kind of a real life login button
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Login logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1976D2),
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 48), // Full width
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 2,
                ),
                child: Text(
                  'Sign In',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // 1.5 same but with loading animation
            ElevatedButton(
              onPressed: isLoading
                  ? null
                  : () {
                      // Toggle loading state
                      setState(() {
                        isLoading = true;
                      });

                      // Simulate async operation (like API call)
                      Future.delayed(Duration(seconds: 2), () {
                        setState(() {
                          isLoading = false;
                        });
                      });
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1976D2),
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                disabledBackgroundColor: Colors.grey[400],
              ),
              child: isLoading
                  ? SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : Text(
                      'Sign In with pressed animation',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),

            const SizedBox(height: 24),

            // -------------------------------------------------------------------------
            // EXERCISE:
            // 1. Create a button like the one on the image (no animation)
            const Text(
              'Exercise',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const Text(
              '1. Create a button like the one on the image (no animation)',
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              height: 100,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(
                'lib/img/Exercise_1_buttons.jpg',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 12),

            // Solution:
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  // Login logic here
                },
                style: ElevatedButton.styleFrom(
                  // TODO: change color to primary
                  backgroundColor: Color(0xFF2A5CAA),
                  // TODO: change color to lighttextcolor
                  foregroundColor: Color(0xFFFFFFFF),
                  minimumSize: Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  elevation: 4,
                ),
                child: Text(
                  'Iniciar sesión',
                  // TODO: change text style to bold subtitle
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // -------------------------------------------------------------------------
            // EXERCISE:
            // 2. Create a button like the one on the image (with animation)
            const Text(
              'Exercise',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const Text(
              '2. Create a button like the one before (with animation)',
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
            const SizedBox(height: 12),

            // Solution:
            SizedBox(
              width: 300,
              child: ElevatedButton(
                // if onPressed is null, the button will be disabled
                onPressed: isLoginLoading
                    ? null
                    : () {
                        // Toggle loading state
                        setState(() {
                          isLoginLoading = true;
                        });

                        // Simulate async operation (like API call)
                        Future.delayed(Duration(seconds: 2), () {
                          setState(() {
                            isLoginLoading = false;
                          });
                        });
                      },
                style: ElevatedButton.styleFrom(
                  // TODO: change colors to the ones in palette
                  backgroundColor: Color(0xFF2A5CAA),
                  foregroundColor: Color(0xFFFFFFFF),
                  // when disabled, the button will have a grey color
                  disabledBackgroundColor: Color(0xFFBDBDBD),
                  disabledForegroundColor: Color(0xFFFFFFFF),
                  minimumSize: Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  // When disabled, the button will not have elevation
                  elevation: isLoginLoading ? 0 : 4,
                  // When disabled, splash/ripple effect will be disabled
                  splashFactory: isLoginLoading ? NoSplash.splashFactory : null,
                ),
                child: isLoginLoading
                    ? SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                      )
                    : Text(
                        'Iniciar sesión',
                        // TODO: change text style to bold subtitle
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 24),

            // -------------------------------------------------------------------------
            // 2. TextButton
            // -------------------------------------------------------------------------
            const Text(
              '2. TextButton',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 12),

            // -------------------------------------------------------------------------
            // 3. OutlinedButton
            // -------------------------------------------------------------------------
            const Text(
              '3. OutlinedButton',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
