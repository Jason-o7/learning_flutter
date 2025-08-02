import 'package:flutter/material.dart';

class CustomUserDropdown extends StatefulWidget {
  @override
  _CustomUserDropdownState createState() => _CustomUserDropdownState();
}

class _CustomUserDropdownState extends State<CustomUserDropdown> {
  final GlobalKey _buttonKey = GlobalKey();

  void _showUserMenu() async {
    final RenderBox renderBox =
        _buttonKey.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx,
        offset.dy + size.height + 8, // Pequeño margen debajo del botón
        offset.dx + 250, // Ancho del menu
        offset.dy + size.height + 400, // Altura máxima
      ),
      items: [
        // Este PopupMenuItem contendrá todo nuestro contenido personalizado
        PopupMenuItem<String>(
          enabled: false, // Importante: deshabilitar para que no se cierre
          padding: EdgeInsets.zero,
          child: _buildCustomMenuContent(),
        ),
      ],
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }

  Widget _buildCustomMenuContent() {
    return Container(
      width: 250,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header con información del usuario
          _buildUserHeader(),

          Divider(height: 1, thickness: 1, color: Colors.grey[300]),

          // Opciones del menú
          _buildMenuOption(
            icon: Icons.person_outline,
            title: 'Ver Perfil',
            onTap: () {
              Navigator.pop(context);
              _navigateToProfile();
            },
          ),

          _buildMenuOption(
            icon: Icons.settings_outlined,
            title: 'Configuración',
            onTap: () {
              Navigator.pop(context);
              _navigateToSettings();
            },
          ),

          _buildMenuOption(
            icon: Icons.help_outline,
            title: 'Ayuda',
            onTap: () {
              Navigator.pop(context);
              _navigateToHelp();
            },
          ),

          Divider(height: 1, thickness: 1, color: Colors.grey[300]),

          _buildMenuOption(
            icon: Icons.logout,
            title: 'Cerrar Sesión',
            onTap: () {
              Navigator.pop(context);
              _logout();
            },
            isDestructive: true,
          ),
        ],
      ),
    );
  }

  Widget _buildUserHeader() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blue[100],
                child: Icon(Icons.person, color: Colors.blue[700]),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Perez Saavedra',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.grey[800],
                      ),
                    ),
                    Text(
                      'Francisco Gusman',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isDestructive ? Colors.red[50] : Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                size: 18,
                color: isDestructive ? Colors.red[600] : Colors.grey[700],
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: isDestructive ? Colors.red[600] : Colors.grey[800],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Métodos de navegación
  void _navigateToProfile() {
    print('Navegando al perfil...');
    // Navigator.pushNamed(context, '/profile');
  }

  void _navigateToSettings() {
    print('Navegando a configuración...');
    // Navigator.pushNamed(context, '/settings');
  }

  void _navigateToHelp() {
    print('Navegando a ayuda...');
    // Navigator.pushNamed(context, '/help');
  }

  void _logout() {
    print('Cerrando sesión...');
    // Implementar logout
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom User Menu'),
        actions: [
          InkWell(
            key: _buttonKey,
            onTap: _showUserMenu,
            borderRadius: BorderRadius.circular(90),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.blue[100],
                  child: Icon(Icons.person, size: 18, color: Colors.blue[700]),
                ),
              ],
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Presiona el botón de usuario para ver el menú'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // Simular agregar más opciones dinámicamente
                });
              },
              child: Text('Simular agregar más opciones'),
            ),
          ],
        ),
      ),
    );
  }
}
