import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'dart:ui_web' as ui;

import '../main.dart';

class WebFrameScreen extends StatefulWidget {
  final String url;
  final String title;

  const WebFrameScreen({
    required this.url,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  State<WebFrameScreen> createState() => _WebFrameScreenState();
}

class _WebFrameScreenState extends State<WebFrameScreen> {
  late String iframeViewType;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // 고유한 iframe ID 생성
    iframeViewType = 'iframe-${DateTime.now().millisecondsSinceEpoch}';
    // HTML iframe 요소 등록
    ui.platformViewRegistry.registerViewFactory(
      iframeViewType,
          (int viewId) {
        final iframe = html.IFrameElement()
          ..src = widget.url
          ..style.border = 'none'
          ..style.height = '100%'
          ..style.width = '100%'
          ..onLoad.listen((event) {
            if (mounted) {
              setState(() {
                isLoading = false;
              });
            }
          });
        return iframe;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // InheritedWidget을 통해 홈 화면으로 돌아가기
            final navigator = context.findAncestorWidgetOfExactType<NavigatorInherited>();
            if (navigator != null) {
              navigator.navigateToHome();
            }
          },
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: HtmlElementView(viewType: iframeViewType),
          ),
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}