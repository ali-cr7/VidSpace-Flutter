import 'package:go_router/go_router.dart';
import 'package:youtube_clone/features/auth/pages/login_view.dart';
import 'package:youtube_clone/features/auth/pages/signup_view.dart';

class AppRoutes {
  static const String login = '/';
  static const String videoDetail = '/video-detail';
  static const String signUp = '/SignupView';
  static const String search = '/search';
  static const String profile = '/profile';
  // Add more routes as needed

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => LoginView()),
      GoRoute(path: signUp, builder: (context, state) => SignupView()),
    ],
  );
}
