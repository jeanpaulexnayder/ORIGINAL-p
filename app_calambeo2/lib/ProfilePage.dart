import 'package:app_calambeo2/BottomNavBar.dart';
import 'package:app_calambeo2/ConfiguracionPage.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
        title: Text('¡Hola, Explorador!'),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: _toggleCardVisibility, // Muestra u oculta la InfoCard
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/fondo.jpeg', // Fondo de la página original
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('assets/Perfil.jpg'),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Explorando Calambeo',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Guardado',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child:
                            Text('Ver', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 190,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildSavedItem('Tiramisu', 'assets/tiramisu.jpg'),
                        _buildSavedItem('Papas Fritas', 'assets/papas.jpg'),
                        _buildSavedItem('Mac & Queso', 'assets/mac_queso.jpg'),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Actividad de amigos',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: [
                      _buildFriendActivity('Juan guardó una receta de Pasta',
                          'Hace 12 min', 'assets/juan.jpg'),
                      _buildFriendActivity('María guardó una nueva receta',
                          'Hace 1 hora', 'assets/maria.jpg'),
                      _buildFriendActivity('Carlos guardó Pastel vegano',
                          'Hace 1 día', 'assets/carlos.jpg'),
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

  Widget _buildSavedItem(String title, String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              imagePath,
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 4),
          Text(title, style: TextStyle(color: Colors.white)),
          ElevatedButton(
            onPressed: () {},
            child: Text('Detalles'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              textStyle: TextStyle(fontSize: 12),
              backgroundColor: Colors.teal,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFriendActivity(String activity, String time, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(imagePath),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(activity,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)),
              Text(time, style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
