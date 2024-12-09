import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CafeContent extends StatefulWidget {
  @override
  _CafeContentState createState() => _CafeContentState();
}

class _CafeContentState extends State<CafeContent> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Inicializamos el controlador del video
    _controller = VideoPlayerController.asset('assets/videocafe.mp4')
      ..setLooping(true)
      ..initialize().then((_) {
        setState(() {});
        _controller.play(); // Reproducir en bucle
      });
  }

  @override
  void dispose() {
    _controller
        .dispose(); // Limpiar el controlador cuando el widget se destruye
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cafe - Meraki - Autoctonos'),
        backgroundColor: Colors.brown[800],
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
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/fondo_cafe.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3),
                    BlendMode.darken,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                // Restaurante 1: Meraki Cafe (con video)
                _buildRestaurantSection(
                  title: 'Meraki Cafe',
                  description:
                      'Un espacio acogedor donde disfrutar del mejor café artesanal y postres deliciosos.',
                  headerImage: 'assets/cafe4.jpg',
                  avatarImage: 'assets/ParqueMeraki.jpg',
                  phrase: '“El arte del café artesanal empieza aquí”',
                  galleryImages: [
                    'assets/cafe1.jpg',
                    'assets/cafe2.jpg',
                    'assets/cafe3.jpg',
                    'assets/cafe5.jpg',
                  ],
                  videoWidget: _buildVideoWidget(), // Se incluye el video
                ),
                SizedBox(height: 40),
                // Restaurante 2: Autoctonos Cafe (sin video)
                _buildRestaurantSection(
                  title: 'Autoctonos Cafe',
                  description:
                      'Explora sabores locales en un ambiente rústico y cálido.',
                  headerImage: 'assets/taza2.jpg',
                  avatarImage: 'assets/autoctonos.jpg',
                  phrase: '“Sabores que cuentan historias”',
                  galleryImages: [
                    'assets/taza.jpg',
                    'assets/taza3.jpg',
                    'assets/taza4.jpg',
                    'assets/taza5.jpg',
                  ],
                  videoWidget: null, // Sin video
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRestaurantSection({
    required String title,
    required String description,
    required String headerImage,
    required String avatarImage,
    required String phrase,
    required List<String> galleryImages,
    Widget? videoWidget, // Video opcional
  }) {
    return Column(
      children: [
        _buildHeader(headerImage: headerImage, avatarImage: avatarImage),
        SizedBox(height: 20),
        _buildBusinessInfo(
            title: title, description: description, phrase: phrase),
        SizedBox(height: 20),
        if (videoWidget != null)
          videoWidget, // Renderiza el video si está definido
        SizedBox(height: 20),
        _buildGallery(images: galleryImages),
      ],
    );
  }

  Widget _buildHeader({
    required String headerImage,
    required String avatarImage,
  }) {
    return Stack(
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
          left: 16,
          top: 16,
          child: CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(avatarImage),
            backgroundColor: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildBusinessInfo({
    required String title,
    required String description,
    required String phrase,
  }) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 5,
          color: Colors.brown[50],
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[800],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  description,
                  style: TextStyle(fontSize: 16, color: Colors.brown[600]),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.brown[800],
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            phrase,
            style: TextStyle(
              fontSize: 18,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildGallery({required List<String> images}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: images.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return Container(
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
                images[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildVideoWidget() {
    return Container(
      height: 200,
      margin: EdgeInsets.symmetric(horizontal: 16),
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
        child: _controller.value.isInitialized
            ? VideoPlayer(_controller)
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
