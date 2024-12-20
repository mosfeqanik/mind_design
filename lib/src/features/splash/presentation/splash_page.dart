import 'package:flutter/material.dart';

import '/src/features/onboarding/presentation/onboarding_screen.dart';
import '/src/utils/app_assets.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/local_storage_manager.dart';
import '../../authentication/presentation/sign_in_screen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _fadeAnimation;
  bool _isFirstSplash = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.easeInOut,
      ),
    );
    _controller?.forward();

    Future.delayed(const Duration(seconds: 3), () {
      _controller?.reset();
      _controller?.forward();

      setState(() {
        _isFirstSplash = false;
      });

      Future.delayed(const Duration(seconds: 3), () {
        navigateUser(context);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _firstSplash(),
          FadeTransition(
            opacity: _fadeAnimation!,
            child: _isFirstSplash ? Container() : _secondSplash(),
          ),
        ],
      ),
    );
  }

  Widget _firstSplash() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.firstSplashScreenImage),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  Widget _secondSplash() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.secondSplashScreenImage),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  void navigateUser(BuildContext context) async {
    var onboardingShown =
        await LocalStorageManager.readData(AppConstants.onboarding);
    bool shouldShowOnboarding = onboardingShown ?? false;

    if (!shouldShowOnboarding) {
      Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const OnboardingBoard(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = 0.0;
            const end = 1.0;
            const curve = Curves.easeInOut;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return FadeTransition(
              opacity: animation.drive(tween),
              child: child,
            );
          },
        ),
        (Route<dynamic> route) => false,
      );
    } else {
      var token = await LocalStorageManager.readData(
        AppConstants.accessTOKEN,
      );
      if (token != null) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const OnboardingBoard()),
          (Route<dynamic> route) => false,
        );
      } else {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const SignInScreen()),
          (Route<dynamic> route) => false,
        );
      }
    }
  }
}
