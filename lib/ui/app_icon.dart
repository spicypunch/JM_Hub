import 'package:flutter/cupertino.dart';

class AppIconWidget extends StatelessWidget {
  final String iconName;
  final Icon icon;

  const AppIconWidget({
    required this.iconName,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
          ),
        )
      ],
    );
  }
}
