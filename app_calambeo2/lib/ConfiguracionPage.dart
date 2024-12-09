import 'package:app_calambeo2/LoginPage.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final Function() onClose; // Función para cerrar la tarjeta

  InfoCard({required this.onClose}); // Constructor que recibe la función

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClose, // Captura clics fuera de la tarjeta
      child: Container(
        color: Colors.black.withOpacity(0.5), // Fondo semitransparente
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              width: 360, // Ancho mejorado para más espacio
              child: GestureDetector(
                onTap: () {}, // Evita que clics dentro de la tarjeta la cierren
                child: Card(
                  elevation: 16,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Encabezado con título y botón de cierre
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Configuración',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Colors.blueGrey[900],
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.close,
                                color: Colors.redAccent,
                                size: 28,
                              ),
                              onPressed: onClose,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Divider(thickness: 1.5, color: Colors.grey[300]),
                        SizedBox(height: 16),
                        // Sección: Notificaciones
                        Text(
                          'Notificaciones',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.blueGrey[800],
                          ),
                        ),
                        SwitchListTile(
                          title: Text(
                            'Activar notificaciones',
                            style: TextStyle(fontSize: 16),
                          ),
                          value: true, // Manejar estado según se requiera
                          onChanged: (bool value) {},
                          secondary: Icon(
                            Icons.notifications_active_outlined,
                            color: Colors.blueAccent,
                          ),
                        ),
                        SizedBox(height: 20),
                        // Sección: Preferencias
                        Text(
                          'Preferencias',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.blueGrey[800],
                          ),
                        ),
                        ListTile(
                          title: Text('Idioma'),
                          trailing: Icon(Icons.language, color: Colors.teal),
                          onTap: () {},
                        ),
                        ListTile(
                          title: Text('Modo oscuro'),
                          trailing: Icon(Icons.dark_mode, color: Colors.orange),
                          onTap: () {},
                        ),
                        SizedBox(height: 20),
                        // Sección: Cuenta
                        Text(
                          'Cuenta',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.blueGrey[800],
                          ),
                        ),
                        ListTile(
                          title: Text('Cerrar sesión'),
                          trailing: Icon(Icons.logout, color: Colors.redAccent),
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                              (route) => false, // Cierra todas las pantallas
                            );
                          },
                        ),
                        Spacer(),
                        Center(
                          child: Text(
                            'Versión 1.0.0',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ],
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
