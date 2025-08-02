import 'package:flutter/material.dart';

class DropdownMenuPage extends StatefulWidget {
  const DropdownMenuPage({super.key});

  @override
  State<DropdownMenuPage> createState() => _DropdownMenuPageState();
}

class _DropdownMenuPageState extends State<DropdownMenuPage> {
  String _filterSelection = 'None';

  @override
  void initState() {
    super.initState();
    _filterSelection = 'None';
  }

  @override
  Widget build(BuildContext context) {
    // -------------------------------------------------------------------------
    // B E G G I N I N G
    // -------------------------------------------------------------------------
    //
    return Scaffold(
      appBar: AppBar(title: const Text('Dropdown Menu')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -------------------------------------------------------------------------
            // 1.PopupMenu
            // -------------------------------------------------------------------------
            // PopupMenuButton<>  inside "<>" goes the type of the value returned
            //                    when an option is selected.
            // itemBuilder: (context) => [    inside this, we define the options
            // const PopupMenuItem<String>(   like this one
            //    value: 'option1',
            //    child: Text('Option 1'),
            // ),
            const Text(
              '1. PopupMenu',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 12),

            // 1.1 Basic PopupMenuButton
            PopupMenuButton<String>(
              itemBuilder: (BuildContext context) => [
                // Option 1
                const PopupMenuItem<String>(
                  value: 'option1',
                  child: Text('Option 1'),
                ),
                // Option 2
                const PopupMenuItem<String>(
                  value: 'option2',
                  child: Text('Option 2'),
                ),
                // Option 3
                const PopupMenuItem<String>(
                  value: 'option3',
                  child: Text('Option 3'),
                ),
              ],
              onSelected: (String value) {
                // ignore: avoid_print
                print('Seleccionado: $value');
              },
            ),
            const SizedBox(height: 16),

            // 1.2 PopupMenuButton with custom icon
            // Custom icon instead of default three dots
            PopupMenuButton<String>(
              icon: const Icon(Icons.person), // Custom icon goes here
              itemBuilder: (context) => [
                const PopupMenuItem(value: 'perfil', child: Text('Ver Perfil')),
                const PopupMenuItem(
                  value: 'config',
                  child: Text('Configuración'),
                ),
                const PopupMenuItem(
                  value: 'salir',
                  child: Text('Cerrar Sesión'),
                ),
              ],
              // ignore: avoid_print
              onSelected: (value) => print('Acción: $value'),
            ),
            const SizedBox(height: 16),

            // 1.3 PopupMenuButton with clickable text
            PopupMenuButton<int>(
              child: const Text(
                // Text goes inside a child
                'Menú',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              itemBuilder: (context) => [
                const PopupMenuItem(value: 1, child: Text('Primera opción')),
                const PopupMenuItem(value: 2, child: Text('Segunda opción')),
                const PopupMenuItem(value: 3, child: Text('Tercera opción')),
              ],
              // ignore: avoid_print
              onSelected: (value) => print('Número seleccionado: $value'),
            ),
            const SizedBox(height: 16),

            // 1.4 PopupMenuButton with custom style
            Center(
              child: PopupMenuButton<String>(
                icon: const CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person, color: Colors.white, size: 20),
                ),
                // this is so the menu appears below the icon
                offset: const Offset(-130, 45),
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'profile',
                    child: Row(
                      children: [
                        Icon(Icons.account_circle, size: 20),
                        SizedBox(width: 12),
                        Text('Mi Perfil'),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'settings',
                    child: Row(
                      children: [
                        Icon(Icons.settings, size: 20),
                        SizedBox(width: 12),
                        Text('Configuración'),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'notifications',
                    child: Row(
                      children: [
                        Icon(Icons.notifications, size: 20),
                        SizedBox(width: 12),
                        Text('Notificaciones'),
                      ],
                    ),
                  ),
                  const PopupMenuDivider(), // Línea separadora!!!
                  const PopupMenuItem(
                    value: 'logout',
                    child: Row(
                      children: [
                        Icon(Icons.logout, size: 20, color: Colors.red),
                        SizedBox(width: 12),
                        Text(
                          'Cerrar Sesión',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ],
                onSelected: (value) {
                  switch (value) {
                    case 'profile':
                      // we would navigate to profile but for now we just print
                      // ignore: avoid_print
                      print('Navegar a perfil');
                      break;
                    case 'settings':
                      // we would open settings but for now we just print
                      // ignore: avoid_print
                      print('Abrir configuración');
                      break;
                    case 'notifications':
                      // we would open notifications but for now we just print
                      // ignore: avoid_print
                      print('Abrir notificaciones');
                      break;
                    case 'logout':
                      // we would log out but for now we just print
                      // ignore: avoid_print
                      print('Cerrar sesión');
                      break;
                  }
                },
              ),
            ),
            const SizedBox(height: 16),

            // 1.5 Another PopupMenuButton with custom style
            Center(
              child: PopupMenuButton<String>(
                constraints: const BoxConstraints(
                  minWidth: 225, // Minimum width
                  maxWidth: 225, // Maximum width (same value = fixed width)
                ),
                icon: const Icon(Icons.more_vert, color: Colors.grey),
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'edit',
                    child: Row(
                      children: [
                        Icon(Icons.edit, size: 18, color: Colors.blue),
                        SizedBox(width: 8),
                        Text('Editar'),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'share',
                    child: Row(
                      children: [
                        Icon(Icons.share, size: 18, color: Colors.green),
                        SizedBox(width: 8),
                        Text('Compartir'),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'copy',
                    child: Row(
                      children: [
                        Icon(Icons.copy, size: 18, color: Colors.orange),
                        SizedBox(width: 8),
                        Text('Copiar enlace'),
                      ],
                    ),
                  ),
                  const PopupMenuDivider(),
                  const PopupMenuItem(
                    value: 'delete',
                    child: Row(
                      children: [
                        Icon(Icons.delete, size: 18, color: Colors.red),
                        SizedBox(width: 8),
                        Text('Eliminar', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                ],
                onSelected: (action) {
                  // Handle actions
                  print('Action selected: $action');
                },
              ),
            ),
            // -------------------------------------------------------------------------
            // EXERCISE:
            // 1. Create a component like the one on the image
            const Text(
              'Exercise',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const Text(
              '1. Create a component like the one on the image',
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              height: 200,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset('lib/img/Exercise_2.jpg', fit: BoxFit.contain),
            ),
            const SizedBox(height: 12),

            // Solution:
            PopupMenuButton<String>(
              constraints: const BoxConstraints(
                minWidth: 200, // Minimum width
                maxWidth: 200, // Maximum width (same value = fixed width)
              ),
              offset: const Offset(0, 35),
              // Appearance of the items
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'Unchecked',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Unchecked'),
                      const SizedBox(width: 5),
                      _filterSelection == 'Unchecked'
                          ? const Icon(Icons.check, color: Colors.green)
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'Checked',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Checked'),
                      const SizedBox(width: 5),
                      _filterSelection == 'Checked'
                          ? const Icon(Icons.check, color: Colors.green)
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
                PopupMenuDivider(),
                PopupMenuItem(
                  value: 'None',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('None'),
                      const SizedBox(width: 5),
                      _filterSelection == 'None'
                          ? const Icon(Icons.check, color: Colors.green)
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ],
              // Appearance of the menu
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.filter_list,
                        size: 24,
                        color: Colors.blue,
                      ),
                      const SizedBox(width: 5),
                      Text('Filtrar: $_filterSelection'),
                      const Icon(Icons.arrow_drop_down, color: Colors.blue),
                    ],
                  ),
                ),
              ),
              onSelected: (value) {
                switch (value) {
                  case 'None':
                    // we would update the table or something
                    break;
                  case 'Unchecked':
                    // we would update the table or something
                    break;
                  case 'Checked':
                    // we would update the table or something
                    break;
                }
                // ignore: avoid_print
                print('Acción seleccionada: $value');
                setState(() {
                  _filterSelection = value;
                });
              },
            ),

            // -------------------------------------------------------------------------
            // 2. Dropdown Button & Dropdown Button Form Field
            // -------------------------------------------------------------------------
            const Text(
              '2. Dropdown Button & Dropdown Button Form Field',
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
