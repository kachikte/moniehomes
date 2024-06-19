import 'package:auto_route/auto_route.dart';
import 'package:moniehomes/src/presentation/screens/screens.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, path: '/home',),
    AutoRoute(page: LocationRoute.page, path: '/intro', initial: true),
  ];
}



// dart run build_runner build