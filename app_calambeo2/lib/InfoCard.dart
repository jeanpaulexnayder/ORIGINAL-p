import 'package:app_calambeo2/LoginPage.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final Function() onClose; // Función para cerrar la tarjeta

  InfoCard({required this.onClose}); // Constructor que recibe la función

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Captura el clic fuera de la tarjeta
        onClose(); // Llama a la función para cerrar la tarjeta
      },
      child: Container(
        color: Colors.black.withOpacity(
            0.5), // Fondo semitransparente para destacar la tarjeta
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top:
                  100, // Ajustamos la posición vertical para mover la tarjeta más abajo
              bottom: 50, // Puedes ajustar este valor si es necesario
              width: 320, // Ancho de la tarjeta
              child: GestureDetector(
                onTap: () {
                  // Evita que el clic dentro de la tarjeta cierre la tarjeta
                },
                child: Card(
                  elevation: 12, // Aumento de la sombra para destacar más
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(24), // Bordes más suaves
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Foto de perfil con bordes redondeados y sombra sutil
                          Center(
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(
                                'assets/Perfil.jpg', // Imagen de perfil de ejemplo
                              ),
                              backgroundColor: Colors.grey[300],
                            ),
                          ),
                          SizedBox(height: 24),

                          // Información del usuario
                          Text(
                            'Información del Usuario',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                          Divider(color: Colors.grey[300], thickness: 1),
                          SizedBox(height: 16),
                          Text(
                            'Nombre: Explorador',
                            style:
                                TextStyle(fontSize: 16, color: Colors.black87),
                          ),
                          Text(
                            'Email: explorador@ejemplo.com',
                            style:
                                TextStyle(fontSize: 16, color: Colors.black87),
                          ),
                          Text(
                            'Teléfono: +57 123 456 7890',
                            style:
                                TextStyle(fontSize: 16, color: Colors.black87),
                          ),
                          Text(
                            'Dirección: Calle 123, Ibagué, Colombia',
                            style:
                                TextStyle(fontSize: 16, color: Colors.black87),
                          ),
                          SizedBox(height: 24),

                          // Detalles adicionales
                          Text(
                            'Detalles Adicionales',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                            ),
                          ),
                          Divider(color: Colors.grey[300], thickness: 1),
                          SizedBox(height: 16),
                          Text(
                            'Estado de cuenta: Activo',
                            style:
                                TextStyle(fontSize: 14, color: Colors.black87),
                          ),
                          Text(
                            'Suscripción: Plan Premium',
                            style:
                                TextStyle(fontSize: 14, color: Colors.black87),
                          ),
                          Text(
                            'Última conexión: 17/11/2024',
                            style:
                                TextStyle(fontSize: 14, color: Colors.black87),
                          ),
                          SizedBox(height: 24),

                          // Botón de cerrar sesión con fondo rojo y texto blanco
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                // Navegar a HomePage y cerrar la tarjeta
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ),
                                );
                              },
                              child: Text('Cerrar Sesión'),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 12),
                                backgroundColor: Colors.redAccent,
                                foregroundColor: Colors.white,
                                textStyle: TextStyle(fontSize: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
