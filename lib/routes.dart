import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:seoul_subway_info_app/ui/main_screen.dart';
import 'package:seoul_subway_info_app/ui/main_view_model.dart';

import 'di/di_setup.dart';

final router = GoRouter(
    routes: [
      GoRoute(path: '/',
        builder: (context, state) =>
            ChangeNotifierProvider(create: (_) => getIt<SubwayViewModel>(),
                child: const MainScreen()
            ),
      ),
    ]
);