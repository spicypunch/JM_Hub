import 'package:flutter/material.dart';
import 'package:jm_hub/ui/app_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(color: Colors.blue),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppIconWidget(
              iconName: "LinkedIn",
              imagePath: 'asset/img/linkedin.png',
              onClick: () {},
            ),
            AppIconWidget(
              iconName: "GitHub",
              imagePath: 'asset/img/github.png',
              onClick: () {},
            ),
            AppIconWidget(
              iconName: "Resume",
              imagePath: 'asset/img/resume.png',
              onClick: () {},
            ),
            AppIconWidget(
              iconName: "Blog",
              imagePath: 'asset/img/blog.png',
              onClick: () {},
            ),
          ],
        ),
      ),
    );
  }
}
