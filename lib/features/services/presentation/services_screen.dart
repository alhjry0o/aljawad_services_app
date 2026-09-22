import 'package:flutter/material.dart';
import '../../../core/constants/app_data.dart';
import 'package:go_router/go_router.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('دليل الخدمات')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: AppData.services.length,
        itemBuilder: (context, index) {
          final service = AppData.services[index];
          return Card(
            margin: const EdgeInsets.bottom(12),
            child: ListTile(
              title: Text(service.title, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(service.description),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => context.push('/service-detail?id=${service.id}'),
            ),
          );
        },
      ),
    );
  }
}
