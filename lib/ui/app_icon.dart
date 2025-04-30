import 'package:flutter/material.dart';

class AppIconWidget extends StatelessWidget {
  final String iconName;
  final String imagePath;
  final VoidCallback onClick;

  const AppIconWidget({
    required this.iconName,
    required this.imagePath,
    required this.onClick,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 48),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,

        children: [
          Image.asset(
            imagePath,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          Text(
            iconName,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )
          ),
        ],
      ),
    );
  }
}
