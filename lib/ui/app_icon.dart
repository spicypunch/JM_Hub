import 'package:flutter/material.dart';

import '../main.dart';

class AppIconWidget extends StatelessWidget {
  final String iconName;
  final String imagePath;
  final String url;

  const AppIconWidget({
    required this.iconName,
    required this.imagePath,
    required this.url,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 48),
      child: GestureDetector(
        onTap: () {
            // InheritedWidget을 통해 웹 화면으로 이동
            final navigator = context.findAncestorWidgetOfExactType<NavigatorInherited>();
            if (navigator != null) {
              navigator.navigateToWeb(url, iconName);
            }
        },
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
      ),
    );
  }
}