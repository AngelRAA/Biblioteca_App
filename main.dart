import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/auth_services.dart';
import 'services/book_services.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';
import 'screens/booklist_screen.dart';
import 'screens/add_book_screen.dart'; // Asegúrate de tener esta pantalla

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthService>(
          create: (_) => AuthService(),
        ),
        ChangeNotifierProvider<BookService>(
          create: (_) => BookService(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BIBLIOTECA',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const LoginScreen(),
          '/register': (context) => const RegisterScreen(),
          '/home': (context) => const HomeScreen(),
          '/booklist': (context) => const BookListScreen(),
          '/addbook': (context) => const AddBookScreen(),
        },
      ),
    );
  }
}
