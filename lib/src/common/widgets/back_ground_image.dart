import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackGroundImage extends StatelessWidget {
  const BackGroundImage({
    super.key,
  });
  //this for get the height and width of the device using the get package
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  @override
  Widget build(BuildContext context) {
    print('screenHeight:$screenHeight');
    print('screenWidth:$screenWidth');
    return Container(
      height: screenHeight,
      width: screenWidth,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFFF9A9E),
            Color(0xFFFAD0C4),
          ],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
        image: DecorationImage(
          image: AssetImage('assets/images/back_ground.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
