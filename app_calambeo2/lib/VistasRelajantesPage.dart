import 'package:flutter/material.dart';

class VistasRelajantesPage extends StatelessWidget {
  final List<Map<String, dynamic>> miradores = [
    {
      'nombre': 'Mirador Ancón Tesorito',
      'descripcion':
          'Un lugar único con vistas panorámicas impresionantes que te conectan con la naturaleza y la tranquilidad.',
      'imagen': 'assets/visitante_tesorito3.jpg',
      'fotosVisitantes': [
        'assets/visitante_tesorito1.jpg',
        'assets/visitante_tesorito2.jpg',
        'assets/mirador_ancon.jpg',
        'assets/visitante_tesorito4.jpg',
        'assets/visitante_tesorito5.jpg',
      ],
    },
    {
      'nombre': 'Restaurante Autóctonos',
      'descripcion':
          'Disfruta de la mejor gastronomía local mientras te deleitas con paisajes inolvidables.',
      'imagen': 'assets/restaurante_autoctonos.jpg',
      'fotosVisitantes': [
        'assets/visitante_autoc1.jpg'
            'assets/visitante_autoctonos1.jpg',
        'assets/visitante_autoctonos2.jpg',
        'assets/visitante_autoc2.2.jpg'
            'assets/visitante_autoctonos3.jpg',
        'assets/visitante_autoctonos4.jpg',
        'assets/visitante_autoctonos5.jpg',
        'assets/autoc3.jpg',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Miradores')),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        children: [
          // Recorremos cada mirador para generar su sección completa
          ...miradores.map((mirador) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Título de cada mirador
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    mirador['nombre'],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ),
                // Carrusel con la imagen principal del mirador
                SizedBox(
                  height: 250,
                  child: PageView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          // Imagen del mirador
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(mirador['imagen']),
                                fit: BoxFit.cover,
                              ),
                            ),
                            width: double.infinity,
                            height: 250,
                          ),
                          // Gradiente oscuro para texto
                          Container(
                            width: double.infinity,
                            height: 250,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black.withOpacity(0.7),
                                  Colors.transparent,
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                          ),
                          // Texto del carrusel
                          Positioned(
                            bottom: 20,
                            left: 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  mirador['nombre'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black,
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  mirador['descripcion'],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                // Rueda de desplazamiento
                SizedBox(
                  height: 150,
                  child: ListWheelScrollView(
                    itemExtent: 150,
                    physics: const FixedExtentScrollPhysics(),
                    diameterRatio: 2,
                    perspective: 0.003,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Acción al presionar un lugar
                        },
                        child: Card(
                          color: Colors.teal[50],
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              // Imagen del lugar
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                                child: Image.asset(
                                  mirador['imagen'],
                                  width: 120,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              // Detalles del lugar
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        mirador['nombre'],
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        mirador['descripcion'],
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.teal,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Galería creativa de visitantes
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Galería de Visitantes - ${mirador['nombre']}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[800],
                    ),
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: mirador['fotosVisitantes'].length,
                    itemBuilder: (context, index) {
                      final foto = mirador['fotosVisitantes'][index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            // Foto principal
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                foto,
                                width: 120,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                            // Dibujo animado alrededor
                            Positioned(
                              top: -10,
                              right: -10,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }
}
