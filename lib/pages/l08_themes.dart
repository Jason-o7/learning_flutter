import 'package:flutter/material.dart';

class ThemesPage extends StatelessWidget {
  const ThemesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // -------------------------------------------------------------------------
    // B E G G I N I N G
    // -------------------------------------------------------------------------
    //
    return Scaffold(
      appBar: AppBar(title: const Text('Themes Page')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -------------------------------------------------------------------------
            // 1. Theme.of(context)
            // -------------------------------------------------------------------------
            // Here we have some widgets that use theme colors vs hardcoded colors
            // If we change the theme primary color, these widgets will update automatically
            // since they are using Theme.of(context)
            const Text(
              '1. Theme.of(context)',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 12),

            const Text(
              '1.1 Basic Theme.of(context) examples',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            Text(
              'Me quiero morir (Color hardcodeado)',
              style: TextStyle(color: Colors.blue),
            ),
            Text(
              'Me quiero morir (con el color del tema)',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(height: 16),

            // Theme.of(context) has many attributes predefined that can be overwritten
            // Here are some examples:
            // - Theme.of(context).colorScheme
            // - Theme.of(context).textTheme
            // - Theme.of(context).iconTheme
            // and there are A LOT more....

            // .colorScheme is like a palette of colors used in all widgets that use the theme
            // For example, ElevatedButton uses:
            // backgroundColor: Theme.of(context).colorScheme.primary
            // foregroundColor: Theme.of(context).colorScheme.onPrimary
            // even if we don't specify them

            // Here there are some of the colors that are defined in colorScheme but
            // there are many more available
            const Text(
              '1.2 Theme.of(context).colorScheme',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromARGB(255, 218, 218, 218),
              ),
              child: Column(
                children: [
                  Text(
                    'Primary',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Text(
                    'Secondary',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  Text(
                    'Tertiary',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  Text(
                    'Surface',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                  Text(
                    'Error',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                  Text(
                    'OnPrimary',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  Text(
                    'OnSecondary',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  Text(
                    'Outline',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Theme.of(context).textTheme has many attributes predefined that
            // can be overwritten
            const Text(
              '1.3 Theme.of(context).textTheme',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            Text(
              'DisplayLarge',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Text(
              'DisplayMedium',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              'DisplaySmall',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              'HeadlineLarge',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              'HeadlineMedium',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'HeadlineSmall',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text('TitleLarge', style: Theme.of(context).textTheme.titleLarge),
            Text('TitleMedium', style: Theme.of(context).textTheme.titleMedium),
            Text('TitleSmall', style: Theme.of(context).textTheme.titleSmall),
            Text('BodyLarge', style: Theme.of(context).textTheme.bodyLarge),
            Text('BodyMedium', style: Theme.of(context).textTheme.bodyMedium),
            Text('BodySmall', style: Theme.of(context).textTheme.bodySmall),
            Text('LabelLarge', style: Theme.of(context).textTheme.labelLarge),
            Text('LabelMedium', style: Theme.of(context).textTheme.labelMedium),
            Text('LabelSmall', style: Theme.of(context).textTheme.labelSmall),

            const Text(
              '2. ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 12),

            const Text(
              '2.1 ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
