import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/shopping_item.dart';
import 'models/shopping_list.dart';
import 'screens/home_screen.dart';

Future<void> main() async {
  // ── inicialización previa a runApp ──
  WidgetsFlutterBinding.ensureInitialized();

  // Hive + adapters
  await Hive.initFlutter();
  Hive
    ..registerAdapter(ShoppingItemAdapter())
    ..registerAdapter(ShoppingListAdapter());

  // caja que almacenará las listas
  await Hive.openBox<ShoppingList>('lists');

  // Riverpod + MyApp
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(path: '/', builder: (_, __) => const HomeScreen()),
        GoRoute(path: '/login', builder: (_, __) => const LoginScreen()),
      ],
    );

    return MaterialApp.router(
      title: 'Shopping List MVP',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.teal),
      routerConfig: router,
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () => context.go('/login'));
    return const Scaffold(
      body: Center(child: Text('Splash', style: TextStyle(fontSize: 32))),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Login – próximamente')),
    );
  }
}
