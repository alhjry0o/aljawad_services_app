import 'package:flutter/material';
import '../../../core/constants/app_data.dart';
import '../../../core/widgets/custom_placeholder.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppData.companyName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomLogoPlaceholder(),
            const SizedBox(height: 20),
            Text(
              'حلول متكاملة للتشغيل والصيانة والخدمات',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'نقدم باقة من الخدمات المهنية والحلول المتكاملة لقطاع الشركات والأفراد بأعلى معايير الجودة والاحترافية.',
              style: TextStyle(color: Colors.grey, height: 1.5),
            ),
            const SizedBox(height: 24),
            Card(
              elevation: 0,
              color: Theme.of(context).colorScheme.surface,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'ماذا تحتاج اليوم؟ بحث عن خدمات...',
                    border: InputBorder.none,
                    icon: Icon(Icons.search, color: Colors.grey),
                  ),
                  onTap: () => context.go('/services'),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('خدماتنا المميزة', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                TextButton(onPressed: () => context.go('/services'), child: const Text('عرض الكل')),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                final service = AppData.services[index];
                return ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.check_circle_outline)),
                  title: Text(service.title),
                  subtitle: Text(service.description, maxLines: 1, overflow: TextOverflow.ellipsis),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () => context.push('/service-detail?id=${service.id}'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}