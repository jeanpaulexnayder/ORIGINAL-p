import 'package:flutter/material.dart';

class AlmuerzoContent extends StatefulWidget {
  @override
  _AlmuerzoContentState createState() => _AlmuerzoContentState();
}

class _AlmuerzoContentState extends State<AlmuerzoContent> {
  final List<Map<String, dynamic>> restaurants = [
    {
      'headerImage': 'assets/dosp.jpeg',
      'avatarImage': 'assets/autoctonos.jpg',
      'info':
          '"Autóctonos" es un restaurante que celebra las raíces culinarias de Ibagué y el Tolima...',
      'gallery': [
        'assets/almuerzo1.jpg',
        'assets/almuerzo2.jpg',
        'assets/almuerzo3.jpg',
        'assets/almuerzo4.jpg',
      ],
      'menu': [
        {
          'left': {
            'title': 'Carnes Rojas',
            'items': [
              'Punta de anca - 30.000',
              'Lomo de cerdo al carbón - 28.000',
              'Costillas a la BBQ - 28.000',
              'Plato mixto - 40.000',
            ],
          },
          'right': {
            'title': 'Carnes Blancas',
            'items': [
              'Cordón bleu - 20.000',
              'Pechuga a la plancha - 25.000',
            ],
          },
        },
      ],
    },
    {
      'headerImage': 'assets/sillas.jpg',
      'avatarImage': 'assets/ParqueMeraki.jpg',
      'info':
          '"Parque Temático Meraki" combina la gastronomía con el arte y la naturaleza. Ubicado en un entorno único, este lugar ofrece platillos cuidadosamente preparados que reflejan creatividad e innovación, mientras invita a sus visitantes a disfrutar de espacios temáticos, actividades recreativas y una conexión especial con el medio ambiente. Una experiencia perfecta para toda la familia.',
      'gallery': [
        'assets/comida.jpg',
        'assets/almuerxo.jpeg',
        'assets/plato1.jpg',
        'assets/jugo.jpeg',
        'assets/plato3.jpg',
        'assets/buergerm.jpeg',
        'assets/pizza.jpeg',
      ],
      'menu': [
        {
          'left': {
            'title': 'Sopas y Cremas',
            'items': [
              'Ajiaco santafereño - 18.000',
              'Sopa de lentejas - 12.000',
              'Crema de ahuyama - 14.000',
            ],
          },
          'right': {
            'title': 'Especialidades',
            'items': [
              'Bandeja Paisa - 25.000',
              'Chuleta valluna - 22.000',
              'Cazuela de mariscos - 30.000',
            ],
          },
        },
      ],
    },
    {
      'headerImage': 'assets/visitante_tesorito2.jpg',
      'avatarImage': 'assets/logotesorito.jpg',
      'info':
          '"Mirador Ancón Tesorito" es más que un restaurante, es un lugar mágico donde la buena comida y las vistas impresionantes se encuentran. Desde su ubicación estratégica, ofrece una panorámica espectacular de los paisajes tolimenses mientras deleita a sus comensales con un menú variado que fusiona sabores locales y contemporáneos. Ideal para quienes buscan momentos inolvidables.',
      'gallery': [
        'assets/plato6.jpg',
        'assets/bebida1.jpg',
        'assets/plato4.jpg',
        'assets/plato5.jpg',
        'assets/bebida2.jpg',
        'assets/plato6.jpg',
        'assets/plato7.jpg',
      ],
      'menu': [
        {
          'left': {
            'title': 'Platos Internacionales',
            'items': [
              'Paella - 40.000',
              'Ratatouille - 35.000',
              'Sushi roll especial - 32.000',
            ],
          },
          'right': {
            'title': 'Postres Gourmet',
            'items': [
              'Tiramisú - 15.000',
              'Cheesecake de frutos rojos - 18.000',
              'Creme brûlée - 20.000',
            ],
          },
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Almuerzo'),
        backgroundColor: Colors.orangeAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Fondo principal
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/fondo_restaurante.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.darken,
                  ),
                ),
              ),
            ),
            Column(
              children: restaurants.map((restaurant) {
                return Column(
                  children: [
                    _buildRestaurantSection(restaurant),
                    SizedBox(height: 40),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRestaurantSection(Map<String, dynamic> restaurant) {
    return Column(
      children: [
        _buildHeader(
          restaurant['headerImage'] ?? 'assets/default_header.jpg',
          restaurant['avatarImage'] ?? 'assets/default_avatar.jpg',
        ),
        SizedBox(height: 20),
        _buildBusinessInfo(restaurant['info'] ?? 'Información no disponible'),
        SizedBox(height: 20),
        _buildMenuButton(restaurant['menu'] ?? []),
        SizedBox(height: 20),
        _buildGallery(restaurant['gallery'] ?? []),
      ],
    );
  }

  Widget _buildHeader(String headerImage, String avatarImage) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(headerImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(avatarImage),
            backgroundColor: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildBusinessInfo(String info) {
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
              'Información del Restaurante',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              info,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(List<Map<String, dynamic>> menu) {
    return ElevatedButton(
      onPressed: menu.isNotEmpty
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookMenuPage(menuPages: menu),
                ),
              );
            }
          : null,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.orange,
      ),
      child: Text(
        'Menú',
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  Widget _buildGallery(List<String> gallery) {
    if (gallery.isEmpty) {
      return Text(
        'Galería no disponible',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, color: Colors.white),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Galería de Platos',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 12),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: gallery.length,
            itemBuilder: (context, index) {
              return Container(
                width: 150,
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    gallery[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class BookMenuPage extends StatelessWidget {
  final List<Map<String, dynamic>> menuPages;

  BookMenuPage({required this.menuPages});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade100,
      appBar: AppBar(
        title: Text('Menú'),
        backgroundColor: Colors.orange,
      ),
      body: PageView.builder(
        itemCount: menuPages.length,
        itemBuilder: (context, index) {
          final pageData = menuPages[index];
          return Center(
            child: Container(
              height: 400,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _buildPageSide(
                      pageData['left'] ?? {},
                      Alignment.centerLeft,
                    ),
                  ),
                  Container(width: 2, color: Colors.grey.shade300),
                  Expanded(
                    child: _buildPageSide(
                      pageData['right'] ?? {},
                      Alignment.centerRight,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPageSide(Map<String, dynamic> data, Alignment alignment) {
    return Container(
      padding: EdgeInsets.all(16),
      alignment: alignment,
      child: Column(
        crossAxisAlignment: alignment == Alignment.centerLeft
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          Text(
            data['title'] ?? 'Sin categoría',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.orange.shade800,
            ),
          ),
          SizedBox(height: 16),
          ...List<Widget>.from(
            data['items']?.map<Widget>((item) {
                  return Text(
                    item.toString(),
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  );
                }) ??
                [],
          ),
        ],
      ),
    );
  }
}
