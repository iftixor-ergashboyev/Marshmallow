import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:marshmallow/presentation/page/category_page.dart';
import 'package:marshmallow/presentation/page/image_page.dart';
import 'package:marshmallow/presentation/page/text_page.dart';

import '../presentation/page/finger_page.dart';

class AppRouter {

  static final router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => const CategoryPage(),
        routes: <RouteBase>[
          GoRoute(
            path: 'text',
            builder: (BuildContext context, GoRouterState state) => const TextPage(),
          ),
          GoRoute(
            path: 'image',
            builder: (BuildContext context, GoRouterState state)  => const ImagePage(),
          ),
          GoRoute(
            path: 'finger',
            builder: (BuildContext context, GoRouterState state) => const FingerPage(),
          ),
        ],
      ),
    ],
  );
}