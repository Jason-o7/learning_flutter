import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  const TextPage({super.key});

  @override
  Widget build(BuildContext context) {
    // -------------------------------------------------------------------------
    // B E G G I N I N G
    // -------------------------------------------------------------------------
    return Scaffold(
      appBar: AppBar(title: const Text('Text, Icon & CircleAvatar')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -------------------------------------------------------------------------
            // 1. Text (Widget)
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
            // 1.1 Basic Text
            const Text('1.1 Basic Text'),

            // 1.2 Customized Text
            // I can use "style" to customize the text appearance
            const Text(
              'Customized Text',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.green,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.underline,
              ),
            ),

            // 1.3 Multi-line Text
            // I can use "textAlign" to align the text.
            // - center: Centered
            // - left: Left aligned
            // - right: Right aligned
            // - justify: Justified (both sides aligned)
            // - start: it's almost the same as left, but it adapts to the language, (some languages go from right to left)
            // - end: same as start
            const Text(
              '1.3 This is a very long text that will automatically adjust to multiple lines when there is not enough horizontal space.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.right,
            ),

            // 1.4 Text with Line Limit
            // I can limit the number of lines using "maxLines" and "overflow"
            // - maxLines: Maximum number of lines to display
            // - overflow: How to handle overflowed text
            // --- overflow options:
            // - TextOverflow.clip: Clips the text without any indication
            // - TextOverflow.ellipsis: Adds "..." at the end if the text is too long
            // - TextOverflow.fade: Fades the text at the end if it is too long
            // - TextOverflow.visible: Displays the text without clipping or fading, but it may overflow
            const Text(
              '1.4 This text is limited to only 2 lines and if it is too long it will be cut off with ellipsis, so let\'s see how it looks when it is too long.',
              style: TextStyle(fontSize: 16),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 24),

            // -------------------------------------------------------------------------
            // 2. Icon (Widget)
            // -------------------------------------------------------------------------
            const Text(
              '2. Icon (Widget)',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 12),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // 2.1 Basic Icon
                Icon(Icons.home),
                // 2.2 Icon with Color
                Icon(Icons.favorite, color: Colors.red),
                // 2.3 Icon with Size
                Icon(Icons.star, color: Colors.orange, size: 70),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // 2.4 IconButton - button with icon
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                  tooltip: 'Compartir',
                ),
                // 2.5 ElevatedButton.icon - button with icon and text
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.download),
                  label: const Text('Descargar'),
                ),
                // 2.6 FloatingActionButton with Icon
                FloatingActionButton(
                  mini: true,
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            // -------------------------------------------------------------------------
            // 3. CircleAvatar (Widget)
            // -------------------------------------------------------------------------
            const Text(
              '3. CircleAvatar (Widget)',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // 3.1 CircleAvatar with Icon
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person, color: Colors.white, size: 30),
                ),

                // 3.2 CircleAvatar with Text
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.green,
                  child: Text(
                    'JS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // CircleAvatar with Image
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.orange,
                  // the image is only available if you add it to pubspec.yaml
                  backgroundImage: AssetImage('lib/img/hanako.jpg'),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Example of perfil with CircleAvatar
            const Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.indigo,
                  child: Text(
                    'A',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Usuario Ejemplo',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'usuario@example.com',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 24),
            // more...
          ],
        ),
      ),
    );
  }
}
