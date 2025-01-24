import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'theme_provider.dart';
import 'screens/login.dart';
import 'screens/provincias.dart';
import 'screens/comarcas.dart';
import 'screens/info_comarca.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    final GoRouter _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: '/provincias',
          builder: (context, state) => const ProvinciasScreen(),
        ),
        GoRoute(
          path: '/comarcas',
          builder: (context, state) {
            final provincia = state.extra as Map<String, dynamic>;
            return ComarcasScreen(provincia: provincia);
          },
        ),
        GoRoute(
          path: '/info_comarca',
          builder: (context, state) {
            final comarca = state.extra as Map<String, dynamic>;
            return InfoComarcaScreen(comarca: comarca);
          },
        ),
      ],
    );

    return MaterialApp.router(
      routerConfig: _router,
      title: 'Comarcas App',
      themeMode: themeProvider.themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
    );
  }
}
