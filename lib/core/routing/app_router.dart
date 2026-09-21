import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/services/presentation/services_screen.dart';
import '../../features/requests/presentation/requests_screen.dart';
import '../../features/portfolio/presentation/portfolio_screen.dart';
import '../../features/more/presentation/more_screen.dart';
import '../../features/services/presentation/service_detail_screen.dart';
import '../../features/requests/presentation/create_request_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) => MainNavigationShell(child: child),
      routes: [
        GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
        GoRoute(path: '/services', builder: (context, state) => const ServicesScreen()),
        GoRoute(path: '/requests', builder: (context, state) => const RequestsScreen()),
        GoRoute(path: '/portfolio', builder: (context, state) => const PortfolioScreen()),
        GoRoute(path: '/more', builder: (context, state) => const MoreScreen()),
      ],
    ),
    GoRoute(
      path: '/service-detail',
      builder: (context, state) {
        final serviceId = state.uri.queryParameters['id'] ?? '1';
        return ServiceDetailScreen(serviceId: serviceId);
      },
    ),
    GoRoute(
      path: '/create-request',
      builder: (context, state) {
        final serviceId = state.uri.queryParameters['id'] ?? '1';
        final flowType = state.uri.queryParameters['type'] ?? 'service';
        return CreateRequestScreen(serviceId: serviceId, flowType: flowType);
      },
    ),
  ],
);

class MainNavigationShell extends StatefulWidget {
  final Widget child;
  const MainNavigationShell({required this.child, super.key});

  @override
  State<MainNavigationShell> createState() => _MainNavigationShellState();
}

class _MainNavigationShellState extends State<MainNavigationShell> {
  int _getSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location == '/services') return 1;
    if (location == '/requests') return 2;
    if (location == '/portfolio') return 3;
    if (location == '/more') return 4;
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0: context.go('/'); break;
      case 1: context.go('/services'); break;
      case 2: context.go('/requests'); break;
      case 3: context.go('/portfolio'); break;
      case 4: context.go('/more'); break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: widget.child,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _getSelectedIndex(context),
          onTap: (index) => _onItemTapped(index, context),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
            BottomNavigationBarItem(icon: Icon(Icons.build), label: 'الخدمات'),
            BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'طلباتي'),
            BottomNavigationBarItem(icon: Icon(Icons.business_center), label: 'مشاريعنا'),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'المزيد'),
          ],
        ),
      ),
    );
  }
}