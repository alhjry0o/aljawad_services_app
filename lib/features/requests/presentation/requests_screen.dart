import 'package:flutter/material';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/repositories/local_repository.dart';
import '../../../data/models/request_model.dart';

class RequestsScreen extends ConsumerWidget {
  const RequestsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(requestRepositoryProvider);
    
    return Scaffold(
      appBar: AppBar(title: const Text('طلباتي المفتوحة')),
      body: FutureBuilder<List<ServiceRequestModel>>(
        future: repo.getRequests(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final list = snapshot.data ?? [];
          if (list.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.assignment_late, size: 60, color: Colors.grey),
                  SizedBox(height: 12),
                  Text('لا توجد طلبات مسجلة حالياً على هذا الجهاز.', style: TextStyle(color: Colors.grey)),
                ],
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: list.length,
            itemBuilder: (context, index) {
              final item = list[index];
              return Card(
                child: ListTile(
                  title: Text(item.serviceTitle, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('الحالة: ${item.status} \nالموقع: ${item.siteType} - ${item.address}'),
                  trailing: Text(item.date, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                ),
              );
            },
          );
        },
      ),
    );
  }
}