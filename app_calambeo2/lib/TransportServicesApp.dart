import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TransportServicesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Servicios de Transporte',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TransportServicesPage(),
    );
  }
}

class TransportServicesPage extends StatelessWidget {
  final List<Map<String, dynamic>> transportOptions = [
    {
      'title': 'Taxis',
      'description': [
        'Disponibilidad 24 horas.',
        'Tarifa mínima: \$5,500.',
        'Solicitud por calle o apps como Easy Taxi y Tappsi.',
        'Seguridad: Verificar placa y conductor identificado.',
      ],
      'icon': Icons.local_taxi,
      'image': 'assets/taxi.png',
    },
    {
      'title': 'Busetas',
      'description': [
        'Principal medio de transporte público.',
        'Tarifa: \$2,800.',
        'Amplia cobertura en la ciudad.',
        'Circulación frecuente de día, menor frecuencia de noche.',
      ],
      'icon': Icons.directions_bus,
      'image': 'assets/bus.png',
    },
    {
      'title': 'Uber',
      'description': [
        'Servicio disponible vía app.',
        'Tarifas variables según demanda.',
        'Pago en efectivo o tarjeta.',
        'Disponibilidad limitada en zonas periféricas.',
      ],
      'icon': Icons.phone_android,
      'image': 'assets/uber.png',
      'action': () async {
        const url = 'https://www.uber.com/';
        if (await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(Uri.parse(url));
        } else {
          throw 'No se pudo abrir el enlace: $url';
        }
      },
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transporte'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/carros.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: transportOptions.length,
            itemBuilder: (context, index) {
              final option = transportOptions[index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5,
                margin: const EdgeInsets.only(bottom: 16.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            option['icon'],
                            size: 40,
                            color: Colors.blue,
                          ),
                          const SizedBox(width: 16),
                          Text(
                            option['title'],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ...option['description'].map<Widget>((desc) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Row(
                            children: [
                              Icon(Icons.check_circle,
                                  color: Colors.green, size: 16),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  desc,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                      if (option['title'] == 'Uber') ...[
                        const SizedBox(height: 16),
                        Center(
                          child: ElevatedButton.icon(
                            onPressed: option['action'],
                            icon: Icon(
                              Icons.directions_car,
                              color: Colors.white, // Ícono en color blanco
                            ),
                            label: Text(
                              'Pedir Uber',
                              style: TextStyle(
                                  color: Colors.white), // Texto en color blanco
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue, // Fondo azul
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
