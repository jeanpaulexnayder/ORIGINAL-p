import 'package:flutter/material.dart';

class CreateProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Colors.transparent, // Fondo transparente para el AppBar
        elevation: 0, // Sin sombra en el AppBar
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navegar hacia atrás
          },
        ),
      ),
      extendBodyBehindAppBar: true, // Extiende el cuerpo detrás del AppBar
      body: Stack(
        children: [
          // Imagen de fondo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fondo.jpeg'), // Imagen de fondo
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Contenido principal
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 100), // Ajuste para compensar el AppBar

                  // Imagen cuadrada en la parte superior
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: AssetImage('assets/bebe.jpg'), // Imagen cuadrada
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: Color.fromARGB(0, 0, 0, 0), width: 4),
                    ),
                  ),

                  SizedBox(height: 20),

                  // Título
                  Text(
                    'Crear un nuevo perfil',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black45,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  // Campo de nombre
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Nombre',
                      fillColor: Colors.white.withOpacity(0.8),
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),

                  // Campo de email
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      fillColor: Colors.white.withOpacity(0.8),
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),

                  // Campo de contraseña
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      fillColor: Colors.white.withOpacity(0.8),
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),

                  // Campo de confirmación de contraseña
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirmar Contraseña',
                      fillColor: Colors.white.withOpacity(0.8),
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Botón para crear perfil
                  ElevatedButton(
                    onPressed: () {
                      // Aquí puedes agregar la lógica para crear el perfil
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                      padding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 50),
                    ),
                    child: Text('CREAR PERFIL', style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
