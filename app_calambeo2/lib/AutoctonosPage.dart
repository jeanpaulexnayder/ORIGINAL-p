import 'dart:async';
import 'package:app_calambeo2/ReservaPage.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'TransportServicesApp.dart'; // Asegúrate de tener esta clase en el archivo correcto

class AutoctonosPage extends StatefulWidget {
  @override
  _AutoctonosPageState createState() => _AutoctonosPageState();
}

class _AutoctonosPageState extends State<AutoctonosPage> {
  late GoogleMapController mapController;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  final LatLng _center = const LatLng(
      4.460991033209968, -75.23228464981932); // Coordenadas de Ibagué

  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _addMarker(); // Agregar el marcador al inicializar
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    mapController = controller;
  }

  void _addMarker() {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('location_marker'),
          position: _center,
          infoWindow: InfoWindow(
            title: 'Ubicación',
            snippet: 'Este es el lugar específico.',
          ),
          icon: BitmapDescriptor.defaultMarker, // Icono por defecto
        ),
      );
    });
  }

  void _navigateToTransporte(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TransportServicesPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Autóctonos'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: Image.asset(
              'assets/fondo.jpeg', // Cambia a tu imagen en la carpeta assets
              fit: BoxFit.cover,
            ),
          ),

          // Contenido principal
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logo
                  Center(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset(
                          'assets/autoctonos.jpg',
                          height: 170,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Información general
                  _buildCard(
                    title: 'Información del Lugar',
                    content: Text(
                      'Este sitio ofrece una rica experiencia cultural con tradiciones, '
                      'gastronomía y actividades locales que reflejan la esencia de la región.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Transporte
                  _buildCard(
                    title: 'Opciones de Transporte',
                    content: GestureDetector(
                      onTap: () => _navigateToTransporte(context),
                      child: Row(
                        children: [
                          Icon(Icons.directions_bus, color: Colors.blue),
                          SizedBox(width: 8),
                          Text(
                            'Haz clic aquí para más información',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Dirección
                  _buildCard(
                    title: 'Dirección y Ubicación',
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Calle 10, Carrera 5, Centro Histórico, Ibagué, Tolima',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Horario de Atención: 9:00 AM - 6:00 PM',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  // Redes sociales
                  _buildCard(
                    title: 'Síguenos en Redes Sociales',
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSocialButton(Colors.blue, Icons.facebook,
                            'https://www.facebook.com/tuPerfil', 'Facebook'),
                        SizedBox(width: 10),
                        _buildSocialButton(Colors.pink, Icons.camera_alt,
                            'https://www.instagram.com/tuPerfil', 'Instagram'),
                        SizedBox(width: 10),
                        _buildSocialButton(
                            const Color.fromARGB(255, 13, 0, 29),
                            Icons.music_note,
                            'https://tiktok.com/tuPerfil',
                            'TikTok'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  // Botón de reserva
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Navegar a la página de reserva
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReservationPage(),
                          ),
                        );
                      },
                      child: Text('Reservar Ahora'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent,
                        foregroundColor: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        textStyle: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  // Mapa
                  _buildCard(
                    title: 'Ubicación en el Mapa',
                    content: Container(
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: GoogleMap(
                          mapType: MapType.hybrid,
                          onMapCreated: _onMapCreated,
                          initialCameraPosition: CameraPosition(
                            target: _center,
                            zoom: 18,
                          ),
                          markers: _markers, // Agregamos los marcadores
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard({required String title, required Widget content}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      color: Colors.white.withOpacity(0.8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            content,
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(
      Color color, IconData icon, String url, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: color,
          child: IconButton(
            icon: Icon(icon, color: Colors.white),
            onPressed: () async {
              final Uri uri = Uri.parse(url);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              } else {
                throw 'No se pudo abrir el enlace $url';
              }
            },
          ),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
