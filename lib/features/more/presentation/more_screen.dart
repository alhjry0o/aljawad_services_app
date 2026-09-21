import 'package:flutter/material';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/constants/app_data.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreScreen extends ConsumerWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentMode = ref.watch(themeModeProvider);
    
    return Scaffold(
      appBar: AppBar(title: const Text('المزيد')),
      body: ListView(
        children: [
          const ListHeader(title: 'معلومات الشركة'),
          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('عن الجواد'),
            subtitle: Text('شركة رائدة في قطاع التشغيل والصيانة والنظافة العامة والمقاولات والخدمات اللوجستية.'),
          ),
          ListTile(
            leading: const Icon(Icons.phone),
            title: const Text('الاتصال الموحد'),
            subtitle: const Text('920013406'),
            onTap: () => launchUrl(Uri.parse('tel:920013406')),
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text('البريد الإلكتروني'),
            subtitle: const Text('info@aljawadservices.com'),
            onTap: () => launchUrl(Uri.parse('mailto:info@aljawadservices.com')),
          ),
          const ListHeader(title: 'الإعدادات والمظهر'),
          SwitchListTile(
            title: const Text('الوضع الداكن (Dark Mode)'),
            subtitle: const Text('تبديل مظهر التطبيق فورياً'),
            value: currentMode == ThemeMode.dark,
            onChanged: (val) {
              ref.read(themeModeProvider.notifier).setThemeMode(val ? ThemeMode.dark : ThemeMode.light);
            },
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'الإصدار الحالي الديمو: 1.0.0 (نسخة المعاينة والرفع الاستاتيكي)',
              style: TextStyle(color: Colors.grey, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}

class ListHeader extends StatelessWidget {
  final String title;
  const ListHeader({required this.title, super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
    );
  }
}