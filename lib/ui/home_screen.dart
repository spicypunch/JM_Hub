import 'package:flutter/material.dart';
import 'package:jm_hub/ui/app_icon.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _openUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    try {
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('asset/img/background2.gif'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppIconWidget(
              iconName: "Resume",
              imagePath: 'asset/img/resume.png',
              onClick: () => _openUrl(
                  'https://docs.google.com/document/d/1xms06c3Y01NOUqEiYBo7iXBDITuzqw_Nb2lg9LC-DZU/edit?usp=sharing'),
            ),
            AppIconWidget(
              iconName: "GitHub",
              imagePath: 'asset/img/github.png',
              onClick: () => _openUrl('https://github.com/spicypunch'),
            ),
            AppIconWidget(
              iconName: "Blog",
              imagePath: 'asset/img/blog.png',
              onClick: () => _openUrl('https://velog.io/@godmin66/posts'),
            ),
            AppIconWidget(
              iconName: "LinkedIn",
              imagePath: 'asset/img/linkedin.png',
              onClick: () =>
                  _openUrl('https://www.linkedin.com/in/jmkim19950325/'),
            ),
          ],
        ),
      ),
    );
  }
}
