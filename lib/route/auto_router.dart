import 'package:auto_route/auto_route.dart';
import 'package:lessons3month/pages/detail/detail_page.dart';
import 'package:lessons3month/pages/main/main_page.dart';

part 'auto_router.gr.dart';

@AutoRouterConfig()
class AutoRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MainRoute.page, initial: true),
        AutoRoute(page: DetailRoute.page),
      ];
}
