import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_room/src/features/splash/presentation/splash_page.dart';
import 'package:next_room/src/features/splash/provider/splash_provider.dart';
import 'package:provider/provider.dart';

import '/src/features/authentication/repository/auth_repo.dart';
import 'src/core/data/dio/dio_client.dart';
import 'src/utils/app_assets.dart';
import 'src/utils/app_colors.dart';
import 'src/utils/local_storage_manager.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  await dotenv.load(fileName: AppAssets.envFile);
  await LocalStorageManager.init();
  final dioClient = DioClient();
  runApp(
    MultiProvider(
      providers: [
        Provider<AuthRepo>(
          create: (context) => AuthRepo(dioClient),
        ),
        ChangeNotifierProvider(create: (_) => InitializationProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812),
      minTextAdapt: true,
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
        ),
        useMaterial3: true,
      ),
      home: const SplashPage(),
    );
  }
}
