import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    // -------------------------------------------------------------------------
    // B E G G I N I N G
    // -------------------------------------------------------------------------
    //
    return Scaffold(
      appBar: AppBar(title: const Text('Image Page')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -------------------------------------------------------------------------
            // 1. Image.asset()
            // -------------------------------------------------------------------------
            const Text(
              '1. Image.asset()',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 12),

            // 1.1 Basic Image
            const Text('1.1 Basic Image:'),
            Image.asset('lib/img/hanako.jpg'),

            const SizedBox(height: 16),

            // 1.2 Basic Image with width and height
            const Text('1.2 Image with width and height:'),
            Image.asset(
              'lib/img/hanako.jpg',
              width: MediaQuery.of(context).size.width * 0.7,
              height: 150,
              // fit: BoxFit.cover,
            ),

            const SizedBox(height: 16),

            // 1.3 Basic Image from the Internet
            const Text('1.3 Basic Image from the Internet:'),
            Image.network(
              'https://picsum.photos/400/300',
              width: double.infinity,
              height: 150,
              // fit: BoxFit.cover,
              // Loading state profesional
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.grey[200],
                  child: const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                );
              },
              // Error handling profesional
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.grey[300],
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.broken_image, size: 50, color: Colors.grey),
                      SizedBox(height: 8),
                      Text(
                        'Error al cargar imagen',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                );
              },
            ),

            // -------------------------------------------------------------------------
            // 2. ClipRRect - Bordes redondeados (muy común en apps)
            // -------------------------------------------------------------------------
            const Text(
              '2. ClipRRect - Bordes redondeados',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 12),

            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'lib/img/hanako.jpg',
                width: double.infinity,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 24),

            // -------------------------------------------------------------------------
            // 3. Container + DecorationImage (máximo control)
            // -------------------------------------------------------------------------
            const Text(
              '3. Container + DecorationImage (control total)',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 12),

            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
                image: const DecorationImage(
                  image: AssetImage('lib/img/hanako.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // -------------------------------------------------------------------------
            // 4. CircleAvatar - Imágenes de perfil (estándar industry)
            // -------------------------------------------------------------------------
            const Text(
              '4. CircleAvatar - Imágenes de perfil',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Pequeño (32x32)
                CircleAvatar(
                  radius: 16,
                  backgroundImage: AssetImage('lib/img/hanako.jpg'),
                ),
                // Mediano (64x64)
                CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage('lib/img/hanako.jpg'),
                ),
                // Grande (96x96)
                CircleAvatar(
                  radius: 48,
                  backgroundImage: AssetImage('lib/img/hanako.jpg'),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // -------------------------------------------------------------------------
            // 5. Image.network() - Con manejo profesional de errores
            // -------------------------------------------------------------------------
            const Text(
              '5. Image.network() - Manejo profesional',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 12),

            Image.network(
              'https://picsum.photos/400/300',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
              // Loading state profesional
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.grey[200],
                  child: const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                );
              },
              // Error handling profesional
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.grey[300],
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.broken_image, size: 50, color: Colors.grey),
                      SizedBox(height: 8),
                      Text(
                        'Error al cargar imagen',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 24),

            // -------------------------------------------------------------------------
            // 6. Stack + Overlay (cards profesionales estilo Netflix/Instagram)
            // -------------------------------------------------------------------------
            const Text(
              '6. Stack + Overlay (estilo Instagram/Netflix)',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              height: 200,
              child: Stack(
                children: [
                  // Imagen de fondo
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'lib/img/hanako.jpg',
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Gradient overlay (muy profesional)
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                  // Contenido encima
                  const Positioned(
                    bottom: 16,
                    left: 16,
                    right: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Título Profesional',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Subtítulo con descripción adicional',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // -------------------------------------------------------------------------
            // 7. AspectRatio - Proporción consistente (MUY PROFESIONAL)
            // -------------------------------------------------------------------------
            const Text(
              '7. AspectRatio - Proporción consistente',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 12),

            // 16:9 (video/YouTube style)
            AspectRatio(
              aspectRatio: 16 / 9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset('lib/img/hanako.jpg', fit: BoxFit.cover),
              ),
            ),

            const SizedBox(height: 16),

            // 1:1 (Instagram post style)
            AspectRatio(
              aspectRatio: 1 / 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset('lib/img/hanako.jpg', fit: BoxFit.cover),
              ),
            ),

            const SizedBox(height: 24),

            // -------------------------------------------------------------------------
            // 8. Diferentes BoxFit (CRÍTICO entender)
            // -------------------------------------------------------------------------
            const Text(
              '8. BoxFit Types (MUY IMPORTANTE)',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 12),

            // BoxFit.cover (más usado)
            const Text('BoxFit.cover (más usado en producción):'),
            SizedBox(
              width: double.infinity,
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset('lib/img/hanako.jpg', fit: BoxFit.cover),
              ),
            ),

            const SizedBox(height: 12),

            // BoxFit.contain
            const Text('BoxFit.contain (mantiene toda la imagen):'),
            Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset('lib/img/hanako.jpg', fit: BoxFit.contain),
              ),
            ),

            const SizedBox(height: 24),

            // -------------------------------------------------------------------------
            // 9. Placeholder Pattern (PATRÓN PROFESIONAL)
            // -------------------------------------------------------------------------
            const Text(
              '9. Placeholder Pattern (muy profesional)',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 12),

            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Stack(
                children: [
                  // Placeholder shimmer effect
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        colors: [
                          Colors.grey[200]!,
                          Colors.grey[100]!,
                          Colors.grey[200]!,
                        ],
                      ),
                    ),
                  ),
                  // Icono placeholder
                  const Center(
                    child: Icon(Icons.image, size: 60, color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // -------------------------------------------------------------------------
            // 10. Buenas prácticas profesionales
            // -------------------------------------------------------------------------
            const Text(
              '10. 📋 Prácticas Profesionales',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 12),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.orange.withOpacity(0.3)),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'En entornos profesionales SIEMPRE:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text('✅ Usar fit: BoxFit.cover (95% de los casos)'),
                  Text('✅ Definir width y height explícitos'),
                  Text('✅ Manejar loading states (CircularProgressIndicator)'),
                  Text('✅ Manejar error states (broken_image icon)'),
                  Text('✅ Usar AspectRatio para consistencia'),
                  Text('✅ ClipRRect para bordes redondeados'),
                  Text('✅ cached_network_image para imágenes de internet'),
                  Text('✅ Optimizar tamaños según dispositivo'),
                  SizedBox(height: 8),
                  Text(
                    'Packages profesionales:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('• cached_network_image: Cache automático'),
                  Text('• flutter_svg: Iconos vectoriales'),
                  Text('• image_picker: Cámara/galería'),
                  Text('• photo_view: Zoom profesional'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
