import 'package:flutter/material.dart';
import 'dart:async';

class DesayunoContent extends StatefulWidget {
  @override
  _DesayunoContentState createState() => _DesayunoContentState();
}

class _DesayunoContentState extends State<DesayunoContent> {
  int _currentIndex = 0;
  late PageController _pageController;
  final List<String> _imagePaths = [
    'assets/arcoiris.jpg',
    'assets/comida.jpg',
    'assets/noche.jpg',
    'assets/vista.jpg',
    'assets/sillas.jpg',
    'assets/balcon.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
    _startAutoSlide();
  }

  void _startAutoSlide() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      if (_currentIndex < _imagePaths.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentIndex,
          duration: Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DesayunoWidget(
        pageController: _pageController,
        imagePaths: _imagePaths,
      ),
    );
  }
}

class DesayunoWidget extends StatelessWidget {
  final PageController pageController;
  final List<String> imagePaths;

  DesayunoWidget({
    required this.pageController,
    required this.imagePaths,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/fondo.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4),
            BlendMode.darken,
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Sección principal
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Desayuno Especial',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Disfruta de deliciosos desayunos con arepas, huevos y jugos naturales.',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),

            // Carrusel de imágenes
            Container(
              height: 200,
              child: PageView.builder(
                controller: pageController,
                itemCount: imagePaths.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        imagePaths[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),

            // Sección de servicios
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nuestros Servicios',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        _buildServiceItem('🍽️ Restaurante y Mirador'),
                        _buildServiceItem(
                            '🚗 Servicio de transporte disponible'),
                        _buildServiceItem('📅 Reservas y visitas espontáneas'),
                        _buildServiceItem('🎉 Eventos privados'),
                        _buildServiceItem('💳 Pagos con Nequi y Daviplata'),
                      ],
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

  Widget _buildServiceItem(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
          height: 1.5,
        ),
      ),
    );
  }
}
