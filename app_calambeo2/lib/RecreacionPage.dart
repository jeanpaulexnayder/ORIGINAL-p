import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class RecreacionPage extends StatefulWidget {
  @override
  _RecreacionPageState createState() => _RecreacionPageState();
}

class _RecreacionPageState extends State<RecreacionPage> {
  late VideoPlayerController _videoController;
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, String>> parkItems = [
    {
      "title": "Bicicletas Aereas",
      "image": "assets/bicicletas.jpg",
      "description":
          "Disfruta de actividades llenas de adrenalina en un entorno natural."
    },
    {
      "title": "Caballos",
      "image": "assets/caballos.jpg",
      "description":
          "Descubre la belleza de la flora local en este oasis de tranquilidad."
    },
    {
      "title": "Mirador",
      "image": "assets/mirador.jpg",
      "description": "Un show mágico de luces y sonidos para toda la familia."
    },
    {
      "title": "Senderos",
      "image": "assets/senderos.jpg",
      "description": "Un show mágico de luces y sonidos para toda la familia."
    },
  ];

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset('assets/videomeraki.mp4')
      ..initialize().then((_) {
        setState(
            () {}); // Redibuja el widget una vez que el video se haya inicializado
        _videoController.play();
        _videoController.setLooping(true); // Esto activa el bucle
        _videoController.addListener(() {
          if (_videoController.value.position ==
              _videoController.value.duration) {
            _scrollToDetails();
          }
        });
      }).catchError((error) {
        print("Error al cargar el video: $error");
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToDetails() {
    _scrollController.animateTo(
      MediaQuery.of(context).size.height,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  // Dentro del método build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Parque Temático Meraki',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        backgroundColor: Colors.orangeAccent,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // Video con flecha flotante
            Stack(
              children: [
                if (_videoController.value.isInitialized)
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: VideoPlayer(_videoController),
                  )
                else
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                // Mostrar la flecha solo si el video no ha terminado
                if (!_videoController.value.isPlaying ||
                    _videoController.value.position <
                        _videoController.value.duration)
                  Positioned(
                    bottom: 80, // Ajustar la altura desde la parte inferior
                    left: MediaQuery.of(context).size.width / 2 - 35,
                    child: GestureDetector(
                      onTap: _scrollToDetails,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(16), // Ajustar tamaño general
                        child: Icon(
                          Icons.arrow_downward,
                          size: 40, // Tamaño de la flecha
                          color: Colors.orangeAccent,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            // Información e imágenes
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Bienvenidos al Parque Temático Meraki',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.orangeAccent,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            GridView.builder(
              padding: EdgeInsets.all(16),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.9,
              ),
              itemCount: parkItems.length,
              itemBuilder: (context, index) {
                final item = parkItems[index];
                return GestureDetector(
                  onTap: () {
                    _showParkDetails(context, item);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                            child: Image.asset(
                              item["image"]!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.green[50],
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(20),
                            ),
                          ),
                          child: Text(
                            item["title"]!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.orangeAccent,
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
      ),
    );
  }

  void _showParkDetails(BuildContext context, Map<String, String> item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.asset(
                  item["image"]!,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item["title"]!,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: Colors.green[700],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      item["description"]!,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text('Cerrar',
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
