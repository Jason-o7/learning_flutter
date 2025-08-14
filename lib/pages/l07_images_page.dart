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

            const SizedBox(height: 24),

            // -------------------------------------------------------------------------
            // 2. Container + DecorationImage (máximo control)
            // -------------------------------------------------------------------------
            const Text(
              '2. Container + DecorationImage (control total)',
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
                    color: Colors.black.withValues(alpha: 0.1),
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
            // 3. CircleAvatar - Imágenes de perfil (estándar industry)
            // -------------------------------------------------------------------------
            const Text(
              '3. CircleAvatar - Imágenes de perfil',
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
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
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
                          Colors.black.withValues(alpha: 0.7),
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
            // 7. AspectRatio - Proporción consistente
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

            // BoxFit.cover
            // Llena completamente el contenedor recortando lo que sobra de la imagen
            // ya que no cabe en el contenedor
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

            // BoxFit.fill
            const Text(
              'BoxFit.fill (estira la imagen para llenar el contenedor):',
            ),
            Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 180, 255, 255),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset('lib/img/hanako.jpg', fit: BoxFit.fill),
              ),
            ),

            const SizedBox(height: 12),

            // BoxFit.none
            // Mantiene todo el tamaño original de la imagen sin escalar, además
            // que se centra en el contenedor y puede sobresalir o dejar espacios
            const Text('BoxFit.none:'),
            Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 180, 255, 255),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset('lib/img/hanako.jpg', fit: BoxFit.none),
              ),
            ),

            const SizedBox(height: 24),

            // -------------------------------------------------------------------------
            // 9. Placeholder Pattern (PATRÓN PROFESIONAL)
            // -------------------------------------------------------------------------
            const Text(
              '9. Stack para superponer widgets o en este caso imagenes',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 12),

            Stack(
              children: [
                // Capa 1 (fondo)
                Container(width: 200, height: 200, color: Colors.blue),

                // Capa 2 (encima)
                Container(width: 100, height: 100, color: Colors.red),

                // Capa 3 (más encima)
                Container(width: 50, height: 50, color: Colors.yellow),
              ],
            ),
            Stack(
              children: [
                // Fondo
                Container(width: 200, height: 200, color: Colors.blue),

                // Esquina superior izquierda
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(width: 50, height: 50, color: Colors.red),
                ),

                // Esquina inferior derecha
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(width: 50, height: 50, color: Colors.green),
                ),

                // Centro
                Positioned(
                  top: 75,
                  left: 75,
                  child: Container(width: 50, height: 50, color: Colors.yellow),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
