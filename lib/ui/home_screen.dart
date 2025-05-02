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
              url: 'https://www.linkedin.com/in/%EC%A2%85%EB%AF%BC-%EA%B9%80-92243a216/',
            ),
            AppIconWidget(
              iconName: "GitHub",
              imagePath: 'asset/img/github.png',
              url: 'https://github.com/spicypunch',
            ),
            AppIconWidget(
              iconName: "Resume",
              imagePath: 'asset/img/resume.png',
              url: 'https://your-resume-url.com',
            ),
            AppIconWidget(
              iconName: "Blog",
              imagePath: 'asset/img/blog.png',
              url: 'https://velog.io/@godmin66/posts',
            ),
          ],
        ),
      ),
    );
  }
}