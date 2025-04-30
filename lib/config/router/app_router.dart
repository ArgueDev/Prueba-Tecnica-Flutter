import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../presentation/pages/pages.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(path: '/login', builder: (context, state) => LoginPage()),
      GoRoute(path: '/home', builder: (context, state) => HomePage()),
      GoRoute(path: '/details/:id', builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return ProductDetailsPage(id);
      }),
    ]
  );
}