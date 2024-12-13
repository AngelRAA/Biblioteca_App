import 'package:flutter/material.dart';
import 'package:biblioteca/services/book_services.dart';
import 'package:provider/provider.dart';

class EditBookScreen extends StatefulWidget {
  final Map<String, String> book;
  final int index;

  const EditBookScreen({super.key, required this.book, required this.index});

  @override
  _EditBookScreenState createState() => _EditBookScreenState();
}

class _EditBookScreenState extends State<EditBookScreen> {
  late TextEditingController _titleController;
  late TextEditingController _authorController;
  late TextEditingController _publisherController;
  late TextEditingController _classificationController;
  late TextEditingController _imageUrlController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.book['title']);
    _authorController = TextEditingController(text: widget.book['author']);
    _publisherController =
        TextEditingController(text: widget.book['publisher']);
    _classificationController =
        TextEditingController(text: widget.book['classification']);
    _imageUrlController = TextEditingController(text: widget.book['imageUrl']);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    _publisherController.dispose();
    _classificationController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Libro'),
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
              controller: _imageUrlController,
              decoration: const InputDecoration(labelText: 'URL de Imagen'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Llamar a la función de actualización
                Provider.of<BookService>(context, listen: false).updateBook(
                  widget.index,
                  _titleController.text,
                  _authorController.text,
                  _publisherController.text,
                  _classificationController.text,
                  _imageUrlController.text,
                );
                Navigator.pop(context);
              },
              child: const Text('Guardar Cambios'),
            ),
          ],
        ),
      ),
    );
  }
}
