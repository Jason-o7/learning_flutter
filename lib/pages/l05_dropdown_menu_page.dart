import 'package:flutter/material.dart';

class DropdownMenuPage extends StatefulWidget {
  const DropdownMenuPage({super.key});

  @override
  State<DropdownMenuPage> createState() => _DropdownMenuPageState();
}

class _DropdownMenuPageState extends State<DropdownMenuPage> {
  String _filterSelection = 'None';
  final GlobalKey _threeDotTwoKey = GlobalKey();
  final GlobalKey _profileIconKey = GlobalKey();

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
    // Simple dropdown menus that exist in Flutter:
    // 1. PopupMenuButton
    // 2. DropdownButton
    // 3. DropdownButtonFormField
    // In essence they all work kind of the same way but have different use cases.
    // 1. PopupMenuButton: Used when it doesn't need to show which is the current selected option.
    // because it doesn't automatically show the selected value even if it's possible to do so.
    // It is used for showing a list of options that can be selected such as, a list of actions,
    // settings, etc. Stuff that doesn't need to show the current selection!!!
    // Examples: 3 dots icon that opens a menu with actions (Edit, Delete, Share, etc.)
    // it could pretty much be any action. It's also really good to redirect to
    // another page or show a dialog.
    // ------
    // 2. DropdownButton: Used for selecting a value from a dropdown list.
    // It automatically shows the current selected value but it doesn't have a form validation unlike
    // DropdownButtonFormField and also doesn't allow for decorations.
    // Examples: Selecting a setting such as a language, theme, etc.
    // Filters that are not only icons but also text.
    // Menus such as "Last 7 days", "Last 30 days", "Last 90 days", etc.
    // ------
    // 3. DropdownButtonFormField: Used for selecting a value from a dropdown list within a form.
    // It has form validation and allows for decorations such as labels, hints, etc.
    // Examples: Selecting a country, state, city, etc. within a form.
    // any critical selection that needs to be validated.
    // -------------------------------------------------------------------------
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
                  // ignore: avoid_print
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
                  padding: EdgeInsets.all(0),
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

            // 2.1 Basic DropdownButton
            DropdownButton<String>(
              value: 'option1', // Current selected value
              items: [
                // List of options
                DropdownMenuItem(value: 'option1', child: Text('Option 1')),
                DropdownMenuItem(value: 'option2', child: Text('Option 2')),
              ],
              onChanged: (value) {
                // Do something with the selected value
                // ignore: avoid_print
                print('Selected value: $value');
              },
            ),
            const SizedBox(height: 12),

            // 2.2 Basic DropdownButtonFormField
            DropdownButtonFormField<String>(
              value: 'option1',
              items: [
                DropdownMenuItem(value: 'option1', child: Text('Option 1')),
                DropdownMenuItem(value: 'option2', child: Text('Option 2')),
              ],
              onChanged: (value) {
                // Do something with the selected value
                // ignore: avoid_print
                print('Selected value: $value');
              },
            ),
            const SizedBox(height: 20),

            // -------------------------------------------------------------------------
            // 3. showMenu() + Custom Design
            // -------------------------------------------------------------------------
            const Text(
              '3. showMenu() + Custom Design',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                // 3.1 Basic showMenu()
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blue[100],
                  child: IconButton(
                    icon: Icon(Icons.person, color: Colors.blue[700]),
                    onPressed: () {
                      _showBasicMenu();
                    },
                  ),
                ),

                const SizedBox(width: 12),
                // 3.2 Basic showMenu() below the icon
                CircleAvatar(
                  key: _threeDotTwoKey,
                  radius: 20,
                  backgroundColor: Colors.blue[100],
                  child: IconButton(
                    icon: Icon(
                      Icons.person,
                      color: const Color.fromARGB(255, 25, 210, 145),
                    ),
                    onPressed: () {
                      _showBasicMenuBelowThisIcon();
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // -------------------------------------------------------------------------
            // EXERCISE:
            // 2. Create a custom menu getting together the excercise in
            // l03_layout_widgets_page.dart - EXCERCISE 1
            const Text(
              'Exercise',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 12),

            const Text(
              '2. Create a custom menu getting together the excercise in l03_layout_widgets_page.dart - EXCERCISE 1 with a tappable profile icon',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 12),

            // Solution:
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    // TODO change color: Border color
                    border: Border.all(color: const Color(0x162B2B2B)),
                    borderRadius: BorderRadius.circular(20),
                    // TODO change shadow: to the one in themes
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x40000000),
                        offset: Offset(1, 1),
                        blurRadius: 4,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 20,
                    // TODO change color: Background color
                    backgroundColor: const Color(0xFFF6FAFF),
                    child: IconButton(
                      key: _profileIconKey,
                      icon: Icon(Icons.person, color: Colors.blue[700]),
                      onPressed: () {
                        _showProfileDropdownMenu();
                      },
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // -------------------------------------------------------------------------
            // EXERCISE:
            // 3. Create a popupmenu getting together the excercise in with an icon
            // l03_layout_widgets_page.dart - EXCERCISE 1
            const Text(
              'Exercise',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const Text(
              '3. Create a popupmenu getting together the excercise in with an icon l03_layout_widgets_page.dart - EXCERCISE 1',
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
            const SizedBox(height: 12),

            // Solution:
            Container(
              height: 200,
              width: double.infinity,
              color: const Color.fromARGB(255, 42, 91, 170),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [_buildProfileIconDropdownMenu()],
                ),
              ),
            ),

            const SizedBox(height: 500),
          ],
        ),
      ),
    );
  }

  void _showBasicMenu() {
    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(200, 200, 0, 0),
      items: [
        PopupMenuItem<String>(value: 'option1', child: Text('Option 1')),
        PopupMenuItem<String>(value: 'option2', child: Text('Option 2')),
      ],
    ).then((value) {
      if (value != null) {
        // Do something with the selected value
        // ignore: avoid_print
        print('Selected value from showMenu: $value');
      }
    });
  }

  void _showBasicMenuBelowThisIcon() {
    final RenderBox renderBox =
        _threeDotTwoKey.currentContext!.findRenderObject() as RenderBox;
    final Offset iconPosition = renderBox.localToGlobal(Offset.zero);
    final Size iconSize = renderBox.size;

    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        // We can play with these values to position the menu
        iconPosition.dx,
        iconPosition.dy + iconSize.height,
        iconPosition.dx + iconSize.width,
        iconPosition.dy,
      ),
      items: [
        PopupMenuItem<String>(value: 'option1', child: Text('Option 1')),
        PopupMenuItem<String>(value: 'option2', child: Text('Option 2')),
      ],
    ).then((value) {
      if (value != null) {
        // Do something with the selected value
        // ignore: avoid_print
        print('Selected value from showMenu: $value');
      }
    });
  }

  // -------------------------------------------------------------------------
  // Solution:
  void _showProfileDropdownMenu() {
    final RenderBox renderBox =
        _profileIconKey.currentContext!.findRenderObject() as RenderBox;
    final Offset iconPosition = renderBox.localToGlobal(Offset.zero);
    final Size iconSize = renderBox.size;

    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        iconPosition.dx - 185,
        iconPosition.dy + iconSize.height + 5,
        iconPosition.dx + iconSize.width, // Width of the menu
        iconPosition.dy,
      ),
      items: [
        PopupMenuItem<String>(
          enabled: false,
          padding: EdgeInsets.zero,
          child: _buildProfileDropdownMenuContent(),
        ),
      ],
      color: Colors.white, // Background color of the menu
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Border radius del popup
        side: BorderSide(color: Colors.grey[300]!, width: 1), // Border
      ),
      elevation: 4, // Sombra
      menuPadding: EdgeInsets.all(5), // No padding around the menu
    );
  }

  Widget _buildProfileDropdownMenuContent() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Column(
        children: [
          // T I T L E -------------------------------------------------
          const Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.indigo,
                child: Icon(Icons.person, color: Colors.white, size: 25),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Perez Saavedra Francisco Guzman ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Micorreolargolarguisimo@gmail.com ',
                      style: TextStyle(
                        color: Color.fromARGB(255, 140, 140, 140),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // B U T T O N S ---------------------------------------------
          Divider(color: Colors.grey[300], thickness: 1, height: 10),
          InkWell(
            // ignore: avoid_print
            onTap: () => print('Ver Perfil pressed'),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: const Row(
                children: [
                  Icon(Icons.person, color: Colors.grey),
                  SizedBox(width: 10),
                  Text('Ver Perfil'),
                ],
              ),
            ),
          ),
          InkWell(
            // ignore: avoid_print
            onTap: () => print('Configuración pressed'),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: const Row(
                children: [
                  Icon(Icons.settings, color: Colors.grey),
                  SizedBox(width: 10),
                  Text('Configuración'),
                ],
              ),
            ),
          ),
          Divider(color: Colors.grey[300], thickness: 1, height: 10),
          InkWell(
            // ignore: avoid_print
            onTap: () => print('Cerrar Sesión pressed'),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: const Row(
                children: [
                  Icon(Icons.exit_to_app, color: Colors.grey),
                  SizedBox(width: 10),
                  Text('Cerrar Sesión'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileIconDropdownMenu() {
    return Container(
      decoration: BoxDecoration(
        // TODO change color: Background color
        color: const Color(0xFFF6FAFF),
        // TODO change color: Border color
        border: Border.all(color: const Color(0x162B2B2B)),
        borderRadius: BorderRadius.circular(90),
        // TODO change shadow: to the one in themes
        boxShadow: [
          BoxShadow(
            color: Color(0x40000000),
            offset: Offset(2, 2),
            blurRadius: 1,
            spreadRadius: 2,
          ),
        ],
      ),

      // Dropdown menu is here
      child: PopupMenuButton<String>(
        icon: const Icon(Icons.person, size: 28),
        offset: Offset(0, 55),
        // TODO change color: Background color
        color: const Color(0xFFF6FAFF),
        // Controlar ancho del menú
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width * 0.55,
          maxWidth: MediaQuery.of(context).size.width * 0.55,
        ),
        itemBuilder: (BuildContext context) => [
          // Option 1 - Header sin enabled: false
          PopupMenuItem<String>(
            padding: EdgeInsets.all(12),
            enabled: false,
            child: const Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.indigo,
                  child: Icon(Icons.person, color: Colors.white, size: 25),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Perez Saavedra Francisco Guzman ',
                        style: TextStyle(color: Color(0xFF000000)),
                      ),
                      Text(
                        'Micorreolargolarguisimo@gmail.com ',
                        style: TextStyle(color: Color(0xFF8C8C8C)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const PopupMenuDivider(height: 0),
          // Option 2
          const PopupMenuItem<String>(
            padding: EdgeInsets.all(12),
            value: 'VerPerfil',
            child: Row(
              children: [
                Icon(Icons.person_2, size: 16),
                SizedBox(width: 8),
                Text('Ver Perfil'),
              ],
            ),
          ),
          const PopupMenuDivider(height: 0),
          // Option 3
          const PopupMenuItem<String>(
            padding: EdgeInsets.all(12),
            value: 'CerrarSesion',
            child: Row(
              children: [
                Icon(Icons.logout, size: 16, color: Colors.red),
                SizedBox(width: 8),
                Text('Cerrar Sesión', style: TextStyle(color: Colors.red)),
              ],
            ),
          ),
        ],
        onSelected: (String value) {
          switch (value) {
            case 'VerPerfil':
              // Navigate to profile view
              // ignore: avoid_print
              print('Navegar a perfil');
              break;
            case 'CerrarSesion':
              // Handle logout
              // ignore: avoid_print
              print('Cerrar sesión');
              break;
            default:
              // Handle other actions
              // ignore: avoid_print
              print('Acción no reconocida');
          }
        },
      ),
    );
  }
}
