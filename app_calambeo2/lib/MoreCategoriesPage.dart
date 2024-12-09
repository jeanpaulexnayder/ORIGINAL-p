import 'package:app_calambeo2/BottomNavBar.dart';
import 'package:app_calambeo2/CategoryDetailScreen.dart';
import 'package:flutter/material.dart';

class MoreCategoriesPage extends StatefulWidget {
  const MoreCategoriesPage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<MoreCategoriesPage> {
  List<String> categories = [
    'Desayuno',
    'Almuerzo',
    'Cena',
    'Café',
    'Bar',
    'Comida'
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Agregar navegación adicional según el índice seleccionado si es necesario
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explora Calambeo'),
        backgroundColor: Colors.teal,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fondo3.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(185, 255, 255, 255),
                    hintText: '¿Qué estás buscando?',
                    hintStyle: const TextStyle(color: Colors.black),
                    prefixIcon: const Icon(Icons.search, color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.teal),
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryDetailScreen(
                                category: categories[index]),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(185, 255, 255, 255),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _getIconForCategory(categories[index]),
                              const SizedBox(height: 10),
                              Text(
                                categories[index],
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex:
            _selectedIndex, // Usando selectedIndex como se usaba antes
        onItemTapped: _onItemTapped, // Pasando la función _onItemTapped
      ),
    );
  }

  Icon _getIconForCategory(String category) {
    switch (category) {
      case 'Desayuno':
        return const Icon(Icons.free_breakfast, size: 40, color: Colors.black);
      case 'Almuerzo':
        return const Icon(Icons.lunch_dining, size: 40, color: Colors.black);
      case 'Cena':
        return const Icon(Icons.dinner_dining, size: 40, color: Colors.black);
      case 'Café':
        return const Icon(Icons.local_cafe, size: 40, color: Colors.black);
      case 'Bar':
        return const Icon(Icons.local_bar, size: 40, color: Colors.black);
      case 'Comida':
        return const Icon(Icons.fastfood, size: 40, color: Colors.black);
      default:
        return const Icon(Icons.restaurant, size: 40, color: Colors.black);
    }
  }
}
