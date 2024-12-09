import 'package:app_calambeo2/Almuerzo_Content.dart';
import 'package:app_calambeo2/bar_content.dart';
import 'package:app_calambeo2/cafe_content.dart';
import 'package:app_calambeo2/cena_content.dart';
import 'package:flutter/material.dart';

class CategoryDetailScreen extends StatelessWidget {
  final String category;

  const CategoryDetailScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: _getCategoryContent(),
      ),
    );
  }

  // Función para retornar el widget adecuado según la categoría
  Widget _getCategoryContent() {
    switch (category) {
      case 'Almuerzo':
        return AlmuerzoContent();
      case 'Cena':
        return cenacontent();
      case 'Café':
        return CafeContent();
      case 'Bar':
        return bar_content();
      default:
        return Center(
          child: Text(
            'Categoría no encontrada.',
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        );
    }
  }
}
