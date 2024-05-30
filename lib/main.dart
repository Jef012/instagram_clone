import 'package:flutter/material.dart';
import 'package:instagram_clone/presentation/router/app_router.dart';
import 'package:provider/provider.dart';

import 'controller/provider/appProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final AppRouter _appRouter = AppRouter();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        onGenerateRoute: _appRouter.onGenerateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
