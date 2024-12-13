import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:biblioteca/services/book_services.dart';
import 'package:biblioteca/screens/editbook_screen.dart';

class BookListScreen extends StatelessWidget {
  const BookListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Libros'),
      ),
      body: Consumer<BookService>(
        builder: (context, bookService, child) {
          return ListView.builder(
            itemCount: bookService.books.length,
            itemBuilder: (context, index) {
              var book = bookService.books[index];
              return ListTile(
                leading: Image.network(book['imageUrl'] ?? '', width: 50),
                title: Text(book['title'] ?? ''),
                subtitle: Text('Autor: ${book['author']}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        // Navegar a la pantalla de edición y pasar el libro seleccionado
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                EditBookScreen(book: book, index: index),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        bookService.removeBook(index);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addbook');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
