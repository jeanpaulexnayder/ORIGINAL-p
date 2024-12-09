import 'package:flutter/material.dart';

class NaturalezaPage extends StatelessWidget {
  final List<Map<String, dynamic>> lugares = [
    {
      'nombre': 'Jardín Botánico',
      'descripcion':
          'Embárcate en una experiencia única en el Jardín Botánico San Jorge, donde la biodiversidad cobra vida en cada rincón.',
      'descripcion_detalle': '''
🌿 Detalles:
* 🌸 Flora autóctona y flores coloridas.
* 🦋 Fauna diversa en su hábitat natural.
* 🌍 Espacios ideales para fotos únicas.

🎒 Tips:
* Usa ropa y zapatos cómodos.
* No olvides tu cámara.
* Respeta la naturaleza, ¡cuidemos juntos!

📍 Ubicación:
En la bella ciudad de Ibagué, el Jardín Botánico San Jorge te espera para una aventura inolvidable.
    ''',
      'imagen': 'assets/jardincamino.jpg',
      'galeria': [
        'assets/jardin1.jpg',
        'assets/jardin2.jpg',
        'assets/jardin3.jpg',
        'assets/jardin4.jpg',
        'assets/jardin5.jpg',
        'assets/jardin6.jpg',
        'assets/jardin7.jpg',
        'assets/jardin8.jpg',
        'assets/jardin9.jpg',
        'assets/jardin10.jpg',
        'assets/jardin11.jpg',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Naturaleza: Jardín Botánico',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green[900],
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Fondo decorativo con estilo animal print
          Positioned.fill(
            child: Image.asset(
              'assets/animal_print_background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Contenido principal con fondo semitransparente
          Positioned.fill(
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white.withOpacity(0.8), // Fondo semitransparente
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Título principal
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        lugares[0]['nombre']!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[800],
                        ),
                      ),
                    ),
                    // Descripción breve
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        lugares[0]['descripcion']!,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                    // Galería interactiva
                    _buildDynamicGallery(lugares[0]['galeria']),
                    SizedBox(height: 20),
                    // Descripción detallada
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        lugares[0]['descripcion_detalle']!,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget _buildDynamicGallery(List<String> galeria) {
  return Container(
    padding: EdgeInsets.all(16),
    child: Column(
      children: [
        Text(
          'Galería Interactiva',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.green[800],
          ),
        ),
        SizedBox(height: 10),
        // Galería deslizable horizontalmente
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: galeria.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  _openImageViewer(context, galeria, index);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      galeria[index],
                      width: 250,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}

void _openImageViewer(
    BuildContext context, List<String> galeria, int initialIndex) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.black.withOpacity(0.9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            PageView.builder(
              itemCount: galeria.length,
              controller: PageController(initialPage: initialIndex),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Center(
                    child: Image.asset(
                      galeria[index],
                      fit: BoxFit.contain,
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                );
              },
            ),
            Positioned(
              top: 16,
              left: 16,
              child: IconButton(
                icon: Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}
