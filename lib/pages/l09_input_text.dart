import 'package:flutter/material.dart';

class InputTextPage extends StatefulWidget {
  const InputTextPage({super.key});

  @override
  State<InputTextPage> createState() => _InputTextPageState();
}

class _InputTextPageState extends State<InputTextPage> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    // -------------------------------------------------------------------------
    // B E G G I N I N G
    // -------------------------------------------------------------------------
    //
    return Scaffold(
      appBar: AppBar(title: const Text('Input Text Page')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -------------------------------------------------------------------------
            // 1. something...
            // -------------------------------------------------------------------------
            const Text(
              '1. Textfield',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 12),

            const Text(
              '1.1 Textfield básico',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            TextField(),

            const SizedBox(height: 20),

            const Text(
              '1.2 Textfield básico con placeholder',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            TextField(
              decoration: InputDecoration(hintText: 'Escribe algo aquí...'),
            ),

            const SizedBox(height: 20),

            const Text(
              '1.3 TextField con decoración básica',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            TextField(
              decoration: InputDecoration(
                labelText: 'Nombre',
                hintText: 'Ingresa tu nombre',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              '1.4 Input de Email (Login)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            TextField(
              keyboardType: TextInputType.emailAddress, // ← Teclado de email!!!
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'usuario@ejemplo.com',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              '1.5 Input de Contraseña (Login)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            TextField(
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible; // ← Toggle
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              '6. Diferentes tipos de teclado',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Teclado numérico
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Teléfono',
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            // Teclado multilinea
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 3, // ← Múltiples líneas
              decoration: InputDecoration(
                labelText: 'Comentarios',
                hintText: 'Escribe tus comentarios aquí...',
                prefixIcon: Icon(Icons.comment),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              '8. Errores y texto de ayuda',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Input con error
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'usuario@ejemplo.com',
                prefixIcon: Icon(Icons.email),
                errorText: 'Email inválido', // ← Mensaje de error
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2),
                ),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            // Input con mensaje de ayuda
            TextField(
              decoration: InputDecoration(
                labelText: 'Contraseña',
                helperText: 'Mínimo 8 caracteres', // ← Texto de ayuda
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              '9. Form de Login completo',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Email
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      // labelText: 'Email',
                      hintText: 'usuario@ejemplo.com',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      prefixIcon: Icon(Icons.email, color: Colors.blue),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                    ),
                  ),

                  SizedBox(height: 16),

                  // Password
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      prefixIcon: Icon(Icons.lock, color: Colors.blue),
                      suffixIcon: Icon(Icons.visibility_off),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                    ),
                  ),

                  SizedBox(height: 24),

                  // Botón
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Iniciar Sesión',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
