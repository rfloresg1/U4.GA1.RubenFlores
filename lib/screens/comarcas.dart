import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ComarcasScreen extends StatelessWidget {
  final Map provincia;

  const ComarcasScreen({required this.provincia, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List comarques = provincia["comarques"];

    return Scaffold(
      appBar: AppBar(
        title: Text('Comarcas de ${provincia["provincia"]}'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/provincias');
          },
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: comarques.length,
        itemBuilder: (context, index) {
          final comarca = comarques[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(comarca["img"]),
              ),
              title: Text(comarca["comarca"]),
              onTap: () {
                context.go('/info_comarca', extra: comarca);
              },
            ),
          );
        },
      ),
    );
  }
}
