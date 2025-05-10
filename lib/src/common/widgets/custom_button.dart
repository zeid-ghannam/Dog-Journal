import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Custom Button Widget
class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final Color color;
  final double fontSize;
  final EdgeInsetsGeometry padding;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.color = Colors.blue, // Default color
    this.fontSize = 16, // Default font size
    this.padding = const EdgeInsets.symmetric(
        vertical: 14, horizontal: 30), // Default padding
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color, // Button color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r), // Rounded corners
        ),
        padding: padding, // Custom padding
        elevation: 5, // Shadow for raised effect
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: fontSize.sp, // Dynamic font size based on screen size
          fontWeight: FontWeight.bold, // Bold font
          color: Colors.white, // Text color
        ),
      ),
    );
  }
}
