import 'package:demo_project/core/constants/colors.dart';
import 'package:flutter/material.dart';
class CustomSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    // GestureDetector detects taps on the widget.
    return GestureDetector(
      onTap: () {
        // We invert the current value and call the onChanged callback.
        onChanged(!value);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        width: 70.0,
        height: 35.0,
        decoration: BoxDecoration(
          // Reduced the border radius to make it more square.
          borderRadius: BorderRadius.circular(12.0),
          // The background color of the track changes based on the switch's state.
          color: cardColor,
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          // The alignment of the thumb changes to move it from left to right.
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.all(4.0),
            width: 36.0,
            height: 36.0,
            decoration: BoxDecoration(
              // Reduced the border radius for the thumb as well.
              borderRadius: BorderRadius.circular(10.0),
              color: const Color(0xFFF0F0F0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}