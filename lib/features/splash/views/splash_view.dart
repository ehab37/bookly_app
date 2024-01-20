import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_bookly/core/utils/app_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnim;

  @override
  void initState() {
    super.initState();
    slidingAnimation();
    navigateHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnim,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnim,
            child: Center(
              child: Image.asset("assets/images/Logo.png"),
            ),
          );
        });
  }

  void slidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingAnim = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }

  void navigateHome() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        GoRouter.of(context).push(AppRouter.homeView);
        // Get.to(() => const HomeView(),
        //     transition: Transition.fadeIn, duration: kTranstionDuration);
      },
    );
  }
}
