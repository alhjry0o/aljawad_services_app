import 'package:flutter/material';
import '../../../core/constants/app_data.dart';
import 'package:go_router/go_router.dart';

class ServiceDetailScreen extends StatelessWidget {
  final String serviceId;
  const ServiceDetailScreen({required this.serviceId, super.key});

  @override
  Widget build(BuildContext context) {
    final service = AppData.services.firstWhere((e) => e.id == serviceId, orElse: () => AppData.services.first);
    
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: Text(service.title)),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 180,
                width: double.infinity,
                color: Colors.grey[300],
                child: const Icon(Icons.image, size: 50, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              Text(service.title, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Text(service.description, style: const TextStyle(fontSize: 16, height: 1.5)),
              const Spacer(),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => context.push('/create-request?id=${service.id}&type=service'),
                icon: const Icon(Icons.send),
                label: const Text('طلب هذه الخدمة الآن', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => context.push('/create-request?id=${service.id}&type=quotation'),
                      child: const Text('طلب عرض سعر'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => context.push('/create-request?id=${service.id}&type=inspection'),
                      child: const Text('طلب معاينة موقع'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}