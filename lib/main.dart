import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:github_repos/src/config/styles.dart';
import 'package:github_repos/src/constants/strings.dart';
import 'package:github_repos/src/services/rest_api/api_service.dart';
import 'package:github_repos/src/services/rest_api/api_url.dart';
import 'package:github_repos/src/services/router.dart';
import 'package:github_repos/src/view_models/home_view_model.dart';
import 'package:provider/provider.dart';

final getIt = GetIt.instance;

void registerModel() {
  getIt.registerSingleton<RestApi>(RestApi());
  getIt.registerSingleton<ApiService>(ApiService());
}

void main() {
  registerModel();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: MaterialApp(
        title: Strings.appTitle,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.primaryTheme,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
