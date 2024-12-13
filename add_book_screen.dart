import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/book_services.dart';

class AddBookScreen extends StatefulWidget {
  const AddBookScreen({super.key});

  @override
  _AddBookScreenState createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  final _publisherController = TextEditingController();
  final _classificationController = TextEditingController();
  final _imageController = TextEditingController();

  void _addBook() {
    String title = _titleController.text;
    String author = _authorController.text;
    String publisher = _publisherController.text;
    String classification = _classificationController.text;
    String imageUrl = _imageController.text;

    if (title.isNotEmpty &&
        author.isNotEmpty &&
        publisher.isNotEmpty &&
        classification.isNotEmpty &&
        imageUrl.isNotEmpty) {
      Provider.of<BookService>(context, listen: false)
          .addBook(title, author, publisher, classification, imageUrl);
      Navigator.pop(context); // Regresar a la lista de libros
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Por favor complete todos los campos')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Nuevo Libro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: _authorController,
              decoration: const InputDecoration(labelText: 'Autor'),
            ),
            TextField(
              controller: _publisherController,
              decoration: const InputDecoration(labelText: 'Editorial'),
            ),
            TextField(
              controller: _classificationController,
              decoration: const InputDecoration(labelText: 'Clasificación'),
            ),
            TextField(
              controller: _imageController,
              decoration: const InputDecoration(labelText: 'URL Imagen'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addBook,
              child: const Text('Agregar Libro'),
            ),
          ],
        ),
      ),
    );
  }
}
