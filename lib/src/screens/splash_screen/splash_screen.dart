import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../common/routes/constant_routes.dart';
import '../../common/widgets/back_ground_image.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    _animation =
    Tween<double>(begin: 0.5, end: 1.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _animationController
        .forward(); // Play the animation once, growing to its end value
    Future.delayed(const Duration(seconds: 4), () {
      Get.offAllNamed(Routes.homeScreen);
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!mounted) return Container();

    print('Image scale: ${_animation.value}');
    return Scaffold(
      body: Stack(
        children: [
          const BackGroundImage(),
          Center(
            child: Container(
              height: 300.h * _animation.value,
              width: 330.h * _animation.value,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(300.r),
                image: DecorationImage(
                    image: AssetImage('assets/images/splash_logo.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
