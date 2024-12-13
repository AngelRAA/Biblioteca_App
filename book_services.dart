import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookService extends ChangeNotifier {
  List<Map<String, String>> _books = [];

  List<Map<String, String>> get books => _books;

  BookService() {
    _loadBooks();
  }

  // Cargar libros desde SharedPreferences
  Future<void> _loadBooks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? bookList = prefs.getStringList('books');

    if (bookList != null) {
      _books = bookList.map((bookString) {
        // Parsear el string de nuevo a Map<String, String>
        var bookData = bookString.split(',');
        return {
          'title': bookData[0],
          'author': bookData[1],
          'publisher': bookData[2],
          'classification': bookData[3],
          'imageUrl': bookData[4],
        };
      }).toList();
    }
    notifyListeners();
  }

  // Guardar libros en SharedPreferences
  Future<void> _saveBooks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> bookList = _books.map((book) {
      return '${book['title']},${book['author']},${book['publisher']},${book['classification']},${book['imageUrl']}';
    }).toList();
    prefs.setStringList('books', bookList);
  }

  // Agregar un libro
  Future<void> addBook(String title, String author, String publisher,
      String classification, String imageUrl) async {
    Map<String, String> newBook = {
      'title': title,
      'author': author,
      'publisher': publisher,
      'classification': classification,
      'imageUrl': imageUrl,
    };

    _books.add(newBook); // Agregar el nuevo libro a la lista
    await _saveBooks(); // Guardar los cambios en SharedPreferences
    notifyListeners(); // Notificar a los listeners
  }

  // Eliminar un libro
  Future<void> removeBook(int index) async {
    _books.removeAt(index);
    await _saveBooks(); // Guardar los cambios en SharedPreferences
    notifyListeners(); // Notificar a los listeners
  }

  // Actualizar un libro existente
  Future<void> updateBook(int index, String title, String author,
      String publisher, String classification, String imageUrl) async {
    _books[index] = {
      'title': title,
      'author': author,
      'publisher': publisher,
      'classification': classification,
      'imageUrl': imageUrl,
    };
    await _saveBooks();
    notifyListeners();
  }
}
