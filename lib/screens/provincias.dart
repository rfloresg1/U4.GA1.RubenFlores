import 'package:flutter/material.dart';
import 'package:ga1/date/counties.dart';
import 'package:go_router/go_router.dart';

class ProvinciasScreen extends StatelessWidget {
  const ProvinciasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List provincias = provincies["provincies"];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provincias'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/');
          },
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: provincias.length,
        itemBuilder: (context, index) {
          final provincia = provincias[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(provincia["img"]),
              ),
              title: Text(provincia["provincia"]),
              onTap: () {
                context.go('/comarcas', extra: provincia);
              },
            ),
          );
        },
      ),
    );
  }
}
