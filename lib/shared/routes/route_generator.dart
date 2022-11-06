import 'package:flutter/material.dart';

import '../../features/gifs/presentation/pages/gif_pages/list_gif_page.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as Map?;
    final availableRoutes = getAvailableRoutes(args);
    final page = availableRoutes[settings.name]!;

    return MaterialPageRoute(settings: settings, builder: page);
  }

  static Map<String, WidgetBuilder> getAvailableRoutes(Map? args) {
    return {
      AppRoutes.gifListPage: (_) => const ListGifPage(),
    };
  }
}
