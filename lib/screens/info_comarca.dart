import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfoComarcaScreen extends StatelessWidget {
  final Map comarca;

  const InfoComarcaScreen({required this.comarca, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(comarca["comarca"]),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(comarca["img"]),
            const SizedBox(height: 20),
            Text(
              comarca["comarca"],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text("Capital: ${comarca["capital"]}"),
            const SizedBox(height: 10),
            Text("Población: ${comarca["poblacio"]}"),
          ],
        ),
      ),
    );
  }
}
