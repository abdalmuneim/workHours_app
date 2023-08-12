import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:workhours/common/resources/app_color.dart';
import 'package:workhours/features/splash/splash_provider.dart';
import 'package:workhours/generated/assets/assets.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late SplashProvider read = context.read<SplashProvider>();

  @override
  void initState() {
    read.init();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            AppColors.primary,
            AppColors.white,
            AppColors.primary,
          ],
        ),
      ),
      child: Center(
        child: Image.asset(
          Assets.assetsImagesLogo,
          width: 50.w,
          height: 50.h,
        ),
      ),
    );
  }
}
