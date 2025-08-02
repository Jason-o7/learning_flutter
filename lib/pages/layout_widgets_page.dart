import 'package:flutter/material.dart';

class LayoutWidgetsPage extends StatelessWidget {
  const LayoutWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // -------------------------------------------------------------------------
    // B E G G I N I N G
    // -------------------------------------------------------------------------
    // Layout widgets are used to arrange other widgets in a specific way.
    // Common layout widgets include:
    // - Row: Arranges children in a horizontal line.
    // - Column: Arranges children in a vertical line.
    // ----
    // - Padding: Adds space around a widget.
    // - SizedBox: Creates a box with a specific size.
    // - Divider: A horizontal line to separate content.
    // - Expanded: Takes up available space in a Row or Column.
    // - Flexible: Similar to Expanded, but allows for more control over how space is allocated.
    // - Container: A versatile widget that can contain other widgets and apply styles.
    // - Center: Centers its child within itself.
    // - Align: Aligns its child within itself.
    // - Stack: Overlaps children on top of each other.
    // - Positioned: Used inside a Stack to position children relative to the edges of the stack.

    return Scaffold(
      appBar: AppBar(title: const Text('Layout Widgets')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -------------------------------------------------------------------------
            // 1. Row: Arranges children (widgets) in a HORIZONTAL line.
            // -------------------------------------------------------------------------
            const Text(
              '1. Row',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 12),

            // 1.1 Basic Row
            const Row(
              children: [
                Icon(Icons.home, color: Colors.blue),
                Text(' Casa '),
                Icon(Icons.favorite, color: Colors.red),
                Text(' Favorito'),
                Icon(Icons.home, color: Colors.blue),
                Text(' Casa '),
                Icon(Icons.favorite, color: Colors.red),
                Text(' Favorito'),
              ],
            ),
            const SizedBox(height: 16),

            // 1.2 Row with MainAxisAlignment
            //
            // MainAxisAlignment controls the horizontal alignment of children in a Row.
            // Options include:
            // - start: Aligns children to the start of the Row (left in LTR
            // - center: Centers children in the Row
            // - end: Aligns children to the end of the Row (right in LTR languages)
            // - spaceBetween: Places free space between children
            // - spaceEvenly: Places free space between and around children
            // - spaceAround: Places free space between and around children (1/2 around for each side)
            const Column(
              children: [
                // start
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('start: '),
                    Icon(Icons.star, color: Colors.amber),
                    Icon(Icons.star, color: Colors.amber),
                  ],
                ),
                // center
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('center: '),
                    Icon(Icons.star, color: Colors.amber),
                    Icon(Icons.star, color: Colors.amber),
                  ],
                ),
                // end
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('end: '),
                    Icon(Icons.star, color: Colors.amber),
                    Icon(Icons.star, color: Colors.amber),
                  ],
                ),
                // spaceBetween
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('spaceBetween'),
                    Icon(Icons.star, color: Colors.amber),
                    Icon(Icons.star, color: Colors.amber),
                  ],
                ),
                // spaceAround
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('spaceAround'),
                    Icon(Icons.star, color: Colors.amber),
                    Icon(Icons.star, color: Colors.amber),
                  ],
                ),
                // spaceEvenly
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('spaceEvenly'),
                    Icon(Icons.star, color: Colors.amber),
                    Icon(Icons.star, color: Colors.amber),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            // 1.3 Row with CrossAxisAlignment
            // CrossAxisAlignment controls the vertical alignment of children in a Row.
            // Options include:
            // - start: Aligns children to the top of the Row
            // - center: Centers children in the Row
            // - end: Aligns children to the bottom of the Row
            // - stretch: Stretches children to fill the Row
            // - baseline: Aligns children along their baseline
            Container(
              width: double.infinity,
              height: 330,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                border: Border.all(color: Colors.blue[200]!),
              ),
              // here it begins
              child: const Column(
                children: [
                  // start (up)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('start: '),
                      Icon(Icons.star, color: Colors.amber, size: 50),
                      Text('Arriba'),
                    ],
                  ),
                  SizedBox(height: 8),

                  // center (center vertical)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('center: '),
                      Icon(Icons.star, color: Colors.amber, size: 50),
                      Text('Centro vertical'),
                    ],
                  ),
                  SizedBox(height: 8),

                  // end (down)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('end: '),
                      Icon(Icons.star, color: Colors.amber, size: 50),
                      Text('Abajo'),
                    ],
                  ),
                  SizedBox(height: 8),
                  // stretch (occupies the full height)
                  // stretch only works if the Row has a defined height
                  SizedBox(
                    height: 50, // like this one
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('stretch: '),
                        Icon(Icons.star, color: Colors.amber, size: 50),
                        Text('Ocupa todo el alto'),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  // baseline (aligned by the baseline)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text('baseline: '),
                      Icon(Icons.star, color: Colors.amber, size: 50),
                      Text('Alineado por la línea base'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // -------------------------------------------------------------------------
            // 2. Column: Arranges children (widgets) in a VERTICAL line.
            // -------------------------------------------------------------------------
            const Text(
              '2. Column',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 12),
            // 2.1 Basic Column
            const Column(
              children: [
                Icon(Icons.home, color: Colors.blue),
                Text(' Casa '),
                Icon(Icons.favorite, color: Colors.red),
                Text(' Favorito'),
                Icon(Icons.home, color: Colors.blue),
                Text(' Casa '),
                Icon(Icons.favorite, color: Colors.red),
                Text(' Favorito'),
              ],
            ),
            const SizedBox(height: 16),
            // 2.2 Column with MainAxisAlignment
            // MainAxisAlignment controls the vertical alignment of children in a Column.
            // Options include:
            // - start: Aligns children to the top of the Column
            // - center: Centers children in the Column
            // - end: Aligns children to the bottom of the Column
            // - spaceBetween: Places free space between children
            // - spaceEvenly: Places free space between and around children
            // - spaceAround: Places free space between and around children (1/2 around for
            //   the first and last children)
            const Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.home, color: Colors.blue),
                Text(' Casa '),
                Icon(Icons.favorite, color: Colors.red),
                Text(' Favorito'),
                Icon(Icons.home, color: Colors.blue),
                Text(' Casa '),
              ],
            ),

            // 2.3 Column with CrossAxisAlignment
            // CrossAxisAlignment controls the horizontal alignment of children in a Column.
            // Options include:
            // - start: Aligns children to the left of the Column
            // - center: Centers children in the Column
            // - end: Aligns children to the right of the Column
            // - stretch: Stretches children to fill the Column
            // - baseline: Aligns children along their baseline
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.yellow[50],
                border: Border.all(color: Colors.orange[200]!),
              ),
              child: Column(
                children: [
                  // start (izquierda)
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('start (izquierda):'),
                      Icon(Icons.arrow_back, color: Colors.blue),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // center
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('center:'),
                      Icon(Icons.favorite, color: Colors.red),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // end (derecha)
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('end (derecha):'),
                      Icon(Icons.arrow_forward, color: Colors.green),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // stretch (ocupa todo el ancho)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text('stretch (todo el ancho):'),
                      Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.purple,
                        child: const Text(
                          'Ocupa todo el ancho',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // baseline (alineado por la línea base)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      const Text('baseline (alineado por la línea base):'),
                      Icon(Icons.star, color: Colors.amber, size: 50),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // -------------------------------------------------------------------------
            // 3. Container: A versatile widget that can contain other widgets and apply styles.
            // -------------------------------------------------------------------------
            const Text(
              '3. Container',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 12),

            // 3.1 Basic Container
            Container(
              width: 200,
              height: 100,
              color: Colors.blue[100],
              child: Text('Basic Container'),
            ),
            const SizedBox(height: 16),

            // 3.2 Container with Padding
            Container(
              padding: const EdgeInsets.all(15),
              color: Colors.green[100],
              child: const Text('Container with Padding'),
            ),
            const SizedBox(height: 16),

            // 3.3 Container with Margin
            Container(
              margin: const EdgeInsets.all(15),
              color: Colors.red[100],
              child: const Text('Container with Margin'),
            ),
            const SizedBox(height: 16),

            // 3.4 Container with Border
            Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.yellow[100],
                border: Border.all(color: Colors.orange, width: 2),
              ),
              child: Text('Container with Border'),
            ),
            const SizedBox(height: 16),

            // 3.5 Container with BoxDecoration
            Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Text('Container with BoxDecoration'),
            ),
            const SizedBox(height: 20),

            // 3.6 Container with Width and Height
            Container(
              width: double
                  .infinity, // Full width (it needs a parent with defined width)
              height:
                  50, // it would also work with double.infinity but a parent with height is not defined
              color: Colors.pink[100],
              child: Text('Container with Width and Height'),
            ),
            const SizedBox(height: 20),

            // 3.7 Container with responsive Width and Height
            Container(
              width:
                  MediaQuery.of(context).size.width *
                  0.8, // 80% of screen width
              height:
                  MediaQuery.of(context).size.height *
                  0.5, // 10% of screen height
              color: Colors.orange[100],
              child: Text('Container with responsive Width and Height'),
            ),
            const SizedBox(height: 16),

            // 3.8 Container that adjusts to its content
            Container(
              // Without specified width or height
              padding: const EdgeInsets.all(16),
              color: Colors.cyan,
              child: const Text('It adjusts to its content'),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.lime,
              child: const Text(
                'This text is longer, so the Container expands automatically',
              ),
            ),
            const SizedBox(height: 20),

            // -------------------------------------------------------------------------
            // EXERCISE:
            // 1. Create a component like the one on the image
            const Text(
              'Exercises',
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
              child: Image.asset('lib/img/Exercise_1.jpg', fit: BoxFit.contain),
            ),
            const SizedBox(height: 12),

            // Solution:
            Center(
              child: Container(
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
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 25,
                          ),
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
                      onTap: () => print('Ver Perfil pressed'),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
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
                      onTap: () => print('Configuración pressed'),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
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
                      onTap: () => print('Cerrar Sesión pressed'),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
