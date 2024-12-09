import 'package:app_calambeo2/ConfiguracionPage.dart';
import 'package:flutter/material.dart';
import 'package:app_calambeo2/BottomNavBar.dart';
import 'AutoctonosPage.dart';
import 'MiradorAnconPage.dart';
import 'ParqueTematicoMerakiPage.dart';
import 'ParaisoEscondidoPage.dart';
import 'JardinBotanicoPage.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  int _selectedIndex = 0;
  bool _isCardVisible = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
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
      appBar: AppBar(
        title: const Text("Explora Calambeo"),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: _toggleCardVisibility,
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                LugarCard(
                  title: 'Autóctonos de la Vereda Ancón Tesorito',
                  subtitle: 'El sabor del Campo en Cada Plato',
                  imagePath: 'assets/autoctonos.jpg',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AutoctonosPage()),
                    );
                  },
                ),
                LugarCard(
                  title: 'Mirador Ancón Tesorito',
                  subtitle: 'Vive el campo y disfruta nuestras comidas.',
                  imagePath: 'assets/ancon_tesorito.jpg',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MiradorAnconPage()),
                    );
                  },
                ),
                LugarCard(
                  title: 'Parque Temático Meraki',
                  subtitle: '¡Aventura y naturaleza en un solo lugar!',
                  imagePath: 'assets/meraki.jpeg',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ParqueTematicoMerakiPage()),
                    );
                  },
                ),
                LugarCard(
                  title: 'Paraíso Escondido',
                  subtitle: 'La mejor vista a la ciudad en un entorno natural.',
                  imagePath: 'assets/paraiso.jpg',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ParaisoEscondidoPage()),
                    );
                  },
                ),
                LugarCard(
                  title: 'Jardín Botánico San Jorge',
                  subtitle: 'Conservación y educación ambiental.',
                  imagePath: 'assets/jardin_botanico.jpg',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => JardinBotanicoPage()),
                    );
                  },
                ),
              ],
            ),
          ),
          // Muestra InfoCard cuando _isCardVisible es true
          if (_isCardVisible) InfoCard(onClose: _toggleCardVisibility),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class LugarCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final VoidCallback onTap;

  const LugarCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 5,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(15.0),
              ),
              child: Image.asset(
                imagePath,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
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
