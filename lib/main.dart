import 'package:flutter/material.dart';

import 'core/di_manager/injection_container.dart';
import 'shared/routes/app_routes.dart';
import 'shared/routes/route_generator.dart';
import 'shared/theme/theme.dart';
import 'shared/utils/navigator_key.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    injectionDependencies();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      themeMode: ThemeMode.light,
      title: 'Gif App',
      navigatorKey: navigatorKey,
      initialRoute: AppRoutes.gifListPage,
      onGenerateRoute: _onGenerateRoute,
    );
  }

  Route? _onGenerateRoute(RouteSettings settings) {
    return RouteGenerator.generateRoute(settings);
  }
}
