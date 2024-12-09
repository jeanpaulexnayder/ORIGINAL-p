import 'package:app_calambeo2/BottomNavBar.dart';
import 'package:app_calambeo2/ConfiguracionPage.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _selectedIndex = 0;
  bool _isMapExpanded = false;
  bool _isCardVisible = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _toggleMapSize() {
    setState(() {
      _isMapExpanded = !_isMapExpanded;
    });
  }

  void _toggleCardVisibility() {
    setState(() {
      _isCardVisible = !_isCardVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'APP Explora Calambeo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: _toggleCardVisibility,
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fondo.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100.0),
                  _buildTextField(
                    hintText: 'Buscar negocios o eventos...',
                    icon: Icons.search,
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Filtros:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orangeAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          elevation: 4,
                        ),
                        child: const Text(
                          'APLICAR',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12.0),
                  Wrap(
                    spacing: 8.0,
                    children: const [
                      _CategoryChip(label: 'Restaurantes'),
                      _CategoryChip(label: 'Tiendas'),
                      _CategoryChip(label: 'Eventos'),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  _buildTextField(
                    hintText: 'yyyy-MM-dd',
                    labelText: 'Rango de fecha',
                    icon: Icons.calendar_today,
                  ),
                  const SizedBox(height: 16.0),
                  _buildTextField(
                    hintText: 'Especificar ubicación...',
                    labelText: 'Ubicación',
                    icon: Icons.location_on,
                  ),
                  const SizedBox(height: 16.0),
                  ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      buildListItem(
                        'Ancon tesorito',
                        'Una ubicación espléndida para descansar y sentir la naturaleza en tus manos, gran comida y bebidas. Aquí encontrarás una variedad de platos autóctonos con ingredientes frescos y sabores únicos que representan la región. Además, el ambiente acogedor y el servicio amable harán de tu visita una experiencia memorable.',
                        'assets/miradornochetesorito.jpg',
                        'assets/mapatesorito.png',
                        'Calle 17_a, Centro, Calambeo',
                      ),
                      buildListItem(
                        'AUTOCTONOS',
                        'MIRADOR PARA LLEVADO DE LA MANO CON LAS VISTAS ESPLENDIDAS DE LA NATURALEZA',
                        'assets/autocnoche.jpg',
                        'assets/mapaautoctonos.png',
                        'FQ69+84, Ibagué, Tolima',
                      ),
                      buildListItem(
                        'MERAKI',
                        'Evento anual con bandas locales e internacionales.',
                        'assets/merakifk.jpeg',
                        'assets/mapaKf.png',
                        'Que mejor lugar que tenga muy lindas vistas',
                      ),
                    ],
                  ),
                ],
              ),
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

  Widget _buildTextField({
    required String hintText,
    String? labelText,
    required IconData icon,
  }) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: Icon(icon, color: Colors.teal),
        filled: true,
        fillColor: Colors.white.withOpacity(0.9),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
      ),
      style: const TextStyle(fontSize: 16),
    );
  }

  Widget buildListItem(String title, String description, String imagePath,
      String mapImagePath, String address) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      color: Colors.white.withOpacity(0.95),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 120.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8.0),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14.0),
                ),
                const SizedBox(height: 4.0),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Ver más',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Colors.teal.withOpacity(0.3)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.teal.withOpacity(0.1),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.teal),
                      SizedBox(width: 8.0),
                      Text(
                        'Ubicación del lugar',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: double.infinity,
                  height: _isMapExpanded ? 300.0 : 150.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(mapImagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.2),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 8.0,
                        right: 8.0,
                        child: IconButton(
                          icon: const Icon(Icons.zoom_out_map,
                              color: Colors.white),
                          onPressed: _toggleMapSize,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;

  const _CategoryChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.teal,
      labelStyle: const TextStyle(color: Colors.white),
    );
  }
}
