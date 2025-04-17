import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:foodappassignment8/core/constants/app_assets.dart';
import 'package:foodappassignment8/core/constants/app_colors.dart';
import 'package:foodappassignment8/core/constants/app_strings.dart';
import 'package:foodappassignment8/core/constants/app_text_styles.dart';
import 'package:foodappassignment8/core/navigation/app_router.gr.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      context.replaceRoute(const HomeRoute());
    });

    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.gradientTop,
            AppColors.gradientCenter,
            AppColors.gradientBottom
          ],
        ),
      ),
      child: Stack(
        children: [
          Center(
            heightFactor: 10,
            child: Text(
              AppsStrings.appName,
              style: AppTextStyles.splashTitle,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppAssets.burger1),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(AppAssets.burger2),
          ),
        ],
      ),
    ));
  }
}
