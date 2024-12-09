import 'package:flutter/material.dart';

class Trekkingpage extends StatelessWidget {
  final List<Map<String, String>> lugares = [
    {
      'nombre': 'Parque Meraki',
      'descripcion':
          'El restaurante parque temático Meraki en Ibagué ofrece una experiencia única de conexión con la naturaleza, ideal para los amantes de la aventura y el ecoturismo.',
      'descripcion_detalle': '''
🌳 Características principales:
• Senderos rodeados de exuberante vegetación.
• Recorrido entre cultivos de café en su estado más natural.
• Experiencia educativa sobre el cultivo y la producción del café.

🍃 Recomendaciones:
• Lleva ropa cómoda y calzado adecuado para caminatas.
• No olvides tu cámara para capturar los paisajes únicos.
• Disfruta de una deliciosa taza de café cultivado en el lugar.

📍 Información adicional:
El trekking es una oportunidad única para aprender sobre el proceso del café, disfrutar de vistas panorámicas y relajarte en un entorno natural revitalizante.
    ''',
      'imagen': 'assets/parqueMaraki.jpeg',
      'imagen_detalle': 'assets/camino2.jpg',
    },
    {
      'nombre': 'Jardín Botánico',
      'descripcion':
          'Embárcate en una experiencia única de trekking en el corazón del Jardín Botánico San Jorge, un paraíso natural que te conecta con la tranquilidad y la biodiversidad del ecosistema andino.',
      'descripcion_detalle': '''
🌳 Características principales:
• Caminos rodeados de frondosos árboles y plantas nativas.
• Espacios de descanso pintorescos como bancas y columpios rústicos.
• Entorno sostenible que promueve la preservación de la biodiversidad.

🍃 Recomendaciones:
• Lleva ropa cómoda, zapatos para caminar y suficiente agua.
• Disfruta de la tranquilidad mientras exploras la flora y fauna local.
• Usa una cámara para capturar momentos mágicos.

📍 Información adicional:
Este trekking es ideal para quienes buscan paz, una conexión con la naturaleza y una actividad física ligera en un entorno revitalizante.
    ''',
      'imagen': 'assets/jardincamino.jpg',
      'imagen_detalle': 'assets/camino5.jpg',
    },
    {
      'nombre': 'Restaurante Tesorito',
      'descripcion':
          'Una experiencia única para los amantes de la naturaleza y la aventura. Disfruta de senderos rodeados de exuberante vegetación y vistas espectaculares del valle de Ibagué.',
      'descripcion_detalle': '''
🌳 Características principales:
• Senderos que atraviesan montañas y colinas.
• Miradores con vistas espectaculares del valle de Ibagué.
• Flora y fauna autóctona en todo el recorrido.

🍃 Recomendaciones:
• Lleva ropa cómoda y calzado resistente para senderismo.
• Detente en los miradores para tomar fotografías impresionantes.
• Disfruta de una comida deliciosa al final del recorrido.

📍 Información adicional:
El trekking culmina con una vista panorámica desde el mirador y una experiencia gastronómica que complementa perfectamente la aventura.
    ''',
      'imagen': 'assets/tesoritocamino.jpg',
      'imagen_detalle': 'assets/camino3.jpg',
    },
    {
      'nombre': 'Restaurante Autóctonos',
      'descripcion':
          'Ideal para los amantes de la naturaleza y quienes buscan una escapada llena de aventuras en un entorno natural lleno de quebradas y arroyos.',
      'descripcion_detalle': '''
🌳 Características principales:
• Caminos rodeados de arroyos y quebradas de aguas cristalinas.
• Vegetación exuberante con flora autóctona.
• Experiencia de conexión con la naturaleza en su máximo esplendor.

🍃 Recomendaciones:
• Lleva zapatos impermeables para disfrutar de las quebradas.
• Usa protector solar y lleva suficiente agua para el recorrido.
• Tómate un momento para relajarte junto a las aguas cristalinas.

📍 Información adicional:
Este trekking combina la tranquilidad del paisaje con la oportunidad de explorar un entorno refrescante y pintoresco.
    ''',
      'imagen': 'assets/autoctonoscamino.jpg',
      'imagen_detalle': 'assets/camino4.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Trekking',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green[800],
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: Image.asset(
              'assets/fondo2.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          // Contenido principal
          PageView.builder(
            itemCount: lugares.length,
            controller: PageController(viewportFraction: 0.7),
            itemBuilder: (context, index) {
              final lugar = lugares[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: GestureDetector(
                  onTap: () {
                    _showLugarDetails(context, lugar);
                  },
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                          image: DecorationImage(
                            image: AssetImage(lugar['imagen']!),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.3),
                                BlendMode.darken),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                lugar['nombre']!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                lugar['descripcion']!,
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                  height: 1.5, // Espaciado entre líneas.
                                  letterSpacing: 0.5, // Espaciado entre letras.
                                ),
                                maxLines:
                                    4, // Limita las líneas para evitar que sea muy extenso.
                                overflow: TextOverflow
                                    .ellipsis, // Agrega puntos suspensivos.
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

void _showLugarDetails(BuildContext context, Map<String, String> lugar) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                lugar['imagen_detalle']!,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lugar['nombre']!,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          lugar['descripcion_detalle']!,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                            height: 1.5, // Ajuste de altura para los espacios
                          ),
                          textAlign:
                              TextAlign.justify, // Para alinearlo con espacios.
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cerrar',
                    style: TextStyle(color: Colors.green[800]),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
