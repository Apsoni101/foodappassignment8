import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:foodappassignment8/core/constants/app_assets.dart';
import 'package:foodappassignment8/core/constants/app_colors.dart';
import 'package:foodappassignment8/core/constants/app_strings.dart';
import 'package:foodappassignment8/core/constants/app_text_styles.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 26),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
                radius: 40,
                backgroundColor: AppColors.hot,
                child: Image.asset(AppAssets.right)),
            const SizedBox(height: 28),
            Text(
              AppsStrings.success,
              style: AppTextStyles.success,
            ),
            const SizedBox(height: 8),
            Text(
              AppsStrings.successTxt,
              style: AppTextStyles.successTxt,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 42),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.buttonBg,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
              ),
              onPressed: () { context.router.pop();},
              child: Text(
                AppsStrings.goBack,
                style: AppTextStyles.goBack,
              ),
            )
          ],
        ),
      ),
    );
  }
}
