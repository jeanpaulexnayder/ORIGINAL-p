import 'package:app_calambeo2/Almuerzo_Content.dart';
import 'package:app_calambeo2/AutoctonosPage.dart';
import 'package:app_calambeo2/ConfiguracionPage.dart';
import 'package:app_calambeo2/ExploraPage.dart';
import 'package:app_calambeo2/JardinBotanicoPage.dart';
import 'package:app_calambeo2/ListPage.dart';
import 'package:app_calambeo2/MiradorAnconPage.dart';
import 'package:app_calambeo2/NaturalezaPage.dart';
import 'package:app_calambeo2/ParaisoEscondidoPage.dart';
import 'package:app_calambeo2/ParqueTematicoMerakiPage.dart';
import 'package:app_calambeo2/ProfilePage.dart';
import 'package:app_calambeo2/RecreacionPage.dart';
import 'package:app_calambeo2/SearchPage.dart';
import 'package:app_calambeo2/TrekkingPage.dart';
import 'package:app_calambeo2/bar_content.dart';
import 'package:app_calambeo2/cafe_content.dart';
import 'package:app_calambeo2/cena_content.dart';
import 'package:app_calambeo2/vistasRelajantesPage.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'BottomNavBar.dart';

class HogarPage extends StatefulWidget {
  @override
  _HogarPageState createState() => _HogarPageState();
}

class _HogarPageState extends State<HogarPage> {
  int _selectedIndex = 0;
  bool _isCardVisible = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SearchPage()));
    } else if (index == 2) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ListPage()));
    } else if (index == 3) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProfilePage()));
    }
  }

  void _toggleCardVisibility() {
    setState(() {
      _isCardVisible = !_isCardVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fondo2.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
                  title: Text('¡Hola, Explorador!'),
                  actions: [
                    IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: _toggleCardVisibility,
                    ),
                  ],
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '¿Qué vamos a descubrir hoy?',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Exploración destacada',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 250,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/explora.jpeg'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            Positioned(
                              bottom: 16,
                              left: 16,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Explora',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '...exploraciones nuevas',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 16,
                              right: 16,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.orangeAccent, // Color del botón
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Explorapage()));
                                },
                                child: Text(
                                  'Explora Reseñas',
                                  style: TextStyle(
                                      color: Colors
                                          .white), // Texto en color blanco
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Categorías',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        GridView.count(
                          crossAxisCount: 3,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          mainAxisSpacing: 9, // Espaciado vertical
                          crossAxisSpacing: 5, // Espaciado horizontal
                          childAspectRatio:
                              1.4, // Proporción ajustada para botones más altos
                          children: [
                            _buildCategoryItem(
                              Icons.lunch_dining,
                              'Almuerzo',
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AlmuerzoContent()),
                                );
                              },
                            ),
                            _buildCategoryItem(
                              Icons.local_bar,
                              'Bar',
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => bar_content()),
                                );
                              },
                            ),
                            _buildCategoryItem(
                              Icons.dinner_dining,
                              'Cena',
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => cenacontent()),
                                );
                              },
                            ),
                            _buildCategoryItem(
                              Icons.local_cafe,
                              'Cafe',
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CafeContent()),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Eventos destacados',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: CarouselSlider(
                              items: [
                                _buildEventCard(
                                    0,
                                    'Recreación',
                                    'assets/ciclas.jpeg',
                                    'Descubre rutas únicas y vive momentos inolvidables.'),
                                _buildEventCard(
                                    1,
                                    'Trekking',
                                    'assets/subir.jpeg',
                                    'Reta tus límites mientras exploras senderos mágicos.'),
                                _buildEventCard(
                                    2,
                                    'Naturaleza',
                                    'assets/cascada.jpg',
                                    'Conéctate con la serenidad de las cascadas.'),
                                _buildEventCard(
                                    3,
                                    'Vistas relajantes',
                                    'assets/vistasRela.jpeg',
                                    'Disfruta paisajes que te dejarán sin aliento.'),
                              ],
                              options: CarouselOptions(
                                height: 220, // Ajusta el tamaño según tu diseño
                                autoPlay: true,
                                autoPlayInterval: Duration(
                                    seconds: 3), // Intervalo entre cambios
                                enlargeCenterPage: true,
                                enableInfiniteScroll: true,
                                viewportFraction: 0.8, // Tamaño del carrusel
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255,
                                  255), // Color de fondo suave para resaltar el contenido
                              borderRadius: BorderRadius.circular(
                                  16), // Bordes redondeados
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black
                                      .withOpacity(0.1), // Sombra suave
                                  blurRadius: 10, // Suaviza la sombra
                                  offset: Offset(
                                      0, 4), // Desplazamiento de la sombra
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(
                                25.0), // Relleno dentro del contenedor
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Título "Calambeo"
                                Center(
                                  child: Text(
                                    "Ruta Calambeo",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orangeAccent,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),

                                // Imagen decorativa
                                Image.asset(
                                  'assets/Calambeo.jpg', // Reemplaza con la ruta de tu imagen
                                  height: 150,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(height: 20),

                                // Título "Lista de Lugares"

                                // Título "Lista de Lugares"
                                Text(
                                  'Lista de Lugares',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orangeAccent,
                                  ),
                                ),
                                SizedBox(height: 15),

                                // GridView con los lugares
                                GridView.builder(
                                  shrinkWrap:
                                      true, // Ajusta la cuadrícula al contenido
                                  physics:
                                      NeverScrollableScrollPhysics(), // Evita el scroll interno
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, // Número de columnas
                                    crossAxisSpacing:
                                        15, // Espaciado horizontal
                                    mainAxisSpacing: 15, // Espaciado vertical
                                    childAspectRatio:
                                        10 / 21, // Proporción ancho/alto
                                  ),
                                  itemCount: 3, // Número de eventos adicionales
                                  itemBuilder: (context, index) {
                                    final eventTitles = [
                                      'Autóctonos de la Vereda Ancón Tesorito',
                                      'Mirador Ancón Tesorito',
                                      "Jardín Botánico San Jorge",
                                    ];

                                    final eventImages = [
                                      'assets/autoctonos.jpg',
                                      'assets/AnconTesorito.jpg',
                                      'assets/JardinBotanicoSanjorge.jpg',
                                    ];

                                    // Acción al tocar el cuadro
                                    void _onEventTap() {
                                      switch (index) {
                                        case 0:
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AutoctonosPage()),
                                          );
                                          break;
                                        case 1:
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MiradorAnconPage()),
                                          );
                                          break;

                                        case 2:
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    JardinBotanicoPage()),
                                          );
                                          break;
                                      }
                                    }

                                    return GestureDetector(
                                      onTap:
                                          _onEventTap, // Llama a la función de navegación
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        elevation: 6,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              // Icono

                                              SizedBox(height: 10),
                                              // Imagen específica para cada evento
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.asset(
                                                  eventImages[index],
                                                  height: 100,
                                                  width: double.infinity,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              // Título del evento
                                              Text(
                                                eventTitles[index],
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              SizedBox(height: 8),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),

                                SizedBox(height: 20),

                                // Título "Ambalá"
                                Center(
                                  child: Text(
                                    "Ruta Ambala",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orangeAccent,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),

                                // Imagen decorativa
                                Image.asset(
                                  'assets/Ambala.jpg', // Reemplaza con la ruta de tu imagen
                                  height: 150,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(height: 20),

                                // Título "Lista de Lugares"

                                Text(
                                  'Lista de Lugares',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orangeAccent,
                                  ),
                                ),
                                SizedBox(height: 10),
                                GridView.builder(
                                  shrinkWrap:
                                      true, // Ajusta la cuadrícula al contenido
                                  physics:
                                      NeverScrollableScrollPhysics(), // Evita el scroll interno
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, // Número de columnas
                                    crossAxisSpacing:
                                        10, // Espaciado horizontal
                                    mainAxisSpacing: 10, // Espaciado vertical
                                    childAspectRatio:
                                        10 / 18, // Proporción ancho/alto
                                  ),
                                  itemCount: 2, // Número de eventos adicionales
                                  itemBuilder: (context, index) {
                                    final eventTitles = [
                                      'Parque Temático Meraki',
                                      'Paraíso Escondido',
                                    ];

                                    final eventImages = [
                                      'assets/ParqueMeraki.jpg',
                                      'assets/ParaisoEscondido.jpg',
                                    ];

                                    // Acción al tocar el cuadro
                                    void _onEventTap() {
                                      switch (index) {
                                        case 0:
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ParqueTematicoMerakiPage()),
                                          );
                                          break;
                                        case 1:
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ParaisoEscondidoPage()),
                                          );
                                          break;
                                      }
                                    }

                                    return GestureDetector(
                                      onTap:
                                          _onEventTap, // Llama a la función de navegación
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        elevation: 4,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              // Icono

                                              SizedBox(height: 10),
                                              // Imagen específica para cada evento
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.asset(
                                                  eventImages[index],
                                                  height: 80,
                                                  width: double.infinity,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              // Título del evento
                                              Text(
                                                eventTitles[index],
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              SizedBox(height: 8),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
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
          if (_isCardVisible) InfoCard(onClose: _toggleCardVisibility),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Widget _buildCategoryItem(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.orangeAccent.withOpacity(0.8),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 32, color: Colors.white),
            SizedBox(height: 4),
            Text(
              label,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventCard(
      int index, String title, String imagePath, String description) {
    return GestureDetector(
      onTap: () {
        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RecreacionPage()),
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Trekkingpage()),
          );
        } else if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NaturalezaPage()),
          );
        } else if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => VistasRelajantesPage()),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(fontSize: 14, color: Colors.white70),
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

class TrekkingPage {}

Widget _buildEventCard(
    int index, String title, String imagePath, String description) {
  return Container(
    height: 220, // Incrementa la altura para más espacio
    margin: EdgeInsets.symmetric(vertical: 8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      image: DecorationImage(
        image: AssetImage(imagePath),
        fit: BoxFit.cover,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 8,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: Stack(
      children: [
        // Sombra oscura sobre la imagen
        Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        // Título y descripción
        Positioned(
          left: 16,
          bottom: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
