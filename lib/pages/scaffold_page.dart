import 'package:flutter/material.dart';

class ScaffoldPage extends StatelessWidget {
  const ScaffoldPage({super.key});

  @override
  Widget build(BuildContext context) {
    // -------------------------------------------------------------------------
    // B E G G I N I N G
    // -------------------------------------------------------------------------
    // 1. Scaffold
    // Scaffold is the main structure of a page that can contain:
    // 1.1 AppBar: Top navigation bar
    // 1.2 Body: Main content area
    // 1.3 Floating Action Button: Circular action button (usually bottom-right)
    // 1.4 Drawer: Side menu
    // 1.5 BottomNavigationBar: Navigation tabs at bottom
    // So I need to use Scaffold if I want to create an interface with these components.
    // - I shouldn't use Scaffold inside another Scaffold (Reusable Widgets).
    // - Scaffold allows me to use Material Design components which is a design
    // system created by Google that looks like most Android apps (for iOS there is Cupertino).
    // -------------------------------------------------------------------------

    return Scaffold(
      // 1.1 AppBar: Top navigation bar
      appBar: AppBar(title: const Text('Basic Stuff')),
      // 1.2 Body: Main content area
      body: const Center(child: Text('Basic Stuff Page...')),
      // 1.3 Floating Action Button Circular action button (usually bottom-right)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action when pressed
        },
        child: const Icon(Icons.add),
      ),
      // 1.4 Drawer
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(leading: Icon(Icons.home), title: Text('Home')),
            ListTile(leading: Icon(Icons.settings), title: Text('Settings')),
          ],
        ),
      ),
      // 1.5 BottomNavigationBar: Navigation tabs at bottom
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
