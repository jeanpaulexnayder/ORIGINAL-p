import 'package:flutter/material.dart';

class Explorapage extends StatefulWidget {
  @override
  _ExplorapageState createState() => _ExplorapageState();
}

class _ExplorapageState extends State<Explorapage> {
  // Lista de lugares con sus logos
  List<Map<String, String>> places = [
    {'name': 'Autóctonos', 'logo': 'assets/autoctonos.jpg'},
    {'name': 'Mirador Ancón Tesorito', 'logo': 'assets/AnconTesorito.jpg'},
    {
      'name': 'Jardín Botánico San Jorge',
      'logo': 'assets/JardinBotanicoSanjorge.jpg'
    },
    {'name': 'Parque Temático Meraki', 'logo': 'assets/ParqueMeraki.jpg'},
    {'name': 'Paraíso Escondido', 'logo': 'assets/ParaisoEscondido.jpg'},
  ];

  // Lugar seleccionado para la reseña
  String? selectedPlace;

  // Lista dinámica para almacenar las reseñas preexistentes
  List<Map<String, dynamic>> reviews = [
    {
      'reviewer': 'Experto Local',
      'review': 'Reseña increíble sobre el lugar, excelente servicio y comida.',
      'rating': 5,
      'images': ['assets/pizza.jpeg', 'assets/buergerm.jpeg'],
      'place': 'Parque Temático Meraki',
    },
    {
      'reviewer': 'Amante de la comida',
      'review': 'Una experiencia que superó mis expectativas. ¡Delicioso!',
      'rating': 4,
      'images': ['assets/almuerxo.jpeg'],
      'place': 'Restaurante La Bella',
    },
    {
      'reviewer': 'Ana María',
      'review': 'Una experiencia única con un ambiente acogedor.',
      'rating': 5,
      'images': ['assets/papas.jpeg', 'assets/jugo.jpeg'],
      'place': 'Café El Aroma',
    },
  ];

  // Lista para almacenar solo las reseñas agregadas por el usuario
  List<Map<String, dynamic>> addedReviews = [];

  // Controladores para capturar la entrada del usuario
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _reviewController = TextEditingController();
  int _rating = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reseñas'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Agrega tu reseña',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              // Selección de lugar
              Text(
                'Selecciona el lugar:',
                style: TextStyle(fontSize: 16),
              ),
              DropdownButton<String>(
                hint: Text('Selecciona un lugar'),
                value: selectedPlace,
                items: places.map((place) {
                  return DropdownMenuItem<String>(
                    value: place['name'],
                    child: Row(
                      children: [
                        Image.asset(
                          place['logo']!,
                          width: 30,
                          height: 30,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 10),
                        Text(place['name']!),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedPlace = value;
                  });
                },
              ),
              SizedBox(height: 10),
              // Campo para el nombre
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Tu nombre',
                  prefixIcon: Icon(Icons.person, color: Colors.teal),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              // Campo para la reseña
              TextField(
                controller: _reviewController,
                decoration: InputDecoration(
                  labelText: 'Tu reseña',
                  prefixIcon: Icon(Icons.edit, color: Colors.teal),
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              SizedBox(height: 10),
              // Selección de calificación
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Calificación:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  DropdownButton<int>(
                    value: _rating,
                    items: List.generate(5, (index) {
                      return DropdownMenuItem(
                        value: index + 1,
                        child: Row(
                          children: List.generate(
                            index + 1,
                            (starIndex) => Icon(Icons.star,
                                color: Colors.yellow[700], size: 20),
                          ),
                        ),
                      );
                    }),
                    onChanged: (value) {
                      setState(() {
                        _rating = value!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Botón para agregar la reseña
              Center(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (_nameController.text.isEmpty ||
                        _reviewController.text.isEmpty ||
                        selectedPlace == null) {
                      // Mostrar un mensaje de advertencia si los campos están vacíos
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Por favor, completa todos los campos.'),
                        backgroundColor: Colors.red,
                      ));
                    } else {
                      setState(() {
                        addedReviews.add({
                          'reviewer': _nameController.text,
                          'review': _reviewController.text,
                          'rating': _rating,
                          'place': selectedPlace,
                          'images':
                              <String>[], // Asegúrate de que sea List<String>
                        });
                        _nameController.clear();
                        _reviewController.clear();
                        selectedPlace =
                            null; // Reiniciar la selección del lugar
                      });
                    }
                  },
                  icon: Icon(Icons.add, color: Colors.white),
                  label: Text(
                    'Agregar reseña',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Divider(),
              // Lista de reseñas
              Text(
                'Reseñas de clientes',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              // Lista de reseñas (tanto las originales como las agregadas)
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: reviews.length + addedReviews.length,
                itemBuilder: (context, index) {
                  if (index < reviews.length) {
                    // Reseñas originales
                    return buildReview(
                      reviews[index]['reviewer'],
                      reviews[index]['review'],
                      reviews[index]['rating'],
                      reviews[index]['images'],
                      reviews[index]['place'],
                      false, // No permitir eliminar
                      index, // Para eliminar en las reseñas agregadas
                    );
                  } else {
                    // Reseñas agregadas
                    return buildReview(
                      addedReviews[index - reviews.length]['reviewer'],
                      addedReviews[index - reviews.length]['review'],
                      addedReviews[index - reviews.length]['rating'],
                      addedReviews[index - reviews.length]['images'],
                      addedReviews[index - reviews.length]['place'],
                      true, // Permitir eliminar
                      index, // Para eliminar la reseña correspondiente
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildReview(String reviewer, String review, int rating,
      List<String> images, String place, bool canDelete, int index) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.teal[300],
                  child: Icon(Icons.person, color: Colors.white),
                ),
                SizedBox(width: 10),
                Text(
                  reviewer,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Row(
                  children: List.generate(
                    rating,
                    (index) =>
                        Icon(Icons.star, color: Colors.yellow[700], size: 20),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              review,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 8),
            // Mostrar el lugar al que corresponde la reseña
            Row(
              children: [
                Text(
                  'Lugar: $place',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                if (canDelete)
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        if (index < reviews.length) {
                          // No eliminar reseñas preexistentes
                        } else {
                          addedReviews.removeAt(index - reviews.length);
                        }
                      });
                    },
                  ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: images.map((image) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      image,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
