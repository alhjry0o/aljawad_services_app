import 'package:flutter/material.dart';
import '../../../core/constants/app_data.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('سجل مشاريعنا')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: AppData.projects.length,
        itemBuilder: (context, index) {
          final project = AppData.projects[index];
          return Card(
            margin: const EdgeInsets.bottom(16),
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 140, color: Colors.grey[300], width: double.infinity, child: const Icon(Icons.business, size: 40)),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(project.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 4),
                      Text(project.category, style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w500)),
                      const SizedBox(height: 8),
                      Text(project.description, style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
