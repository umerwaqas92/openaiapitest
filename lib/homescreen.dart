import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:openaiapitest/appcont.dart';
import 'package:openaiapitest/screens/tab_01.dart';
import 'package:openaiapitest/screens/tab_02.dart';
import 'package:openaiapitest/screens/tab_03.dart';

class HomePage extends GetView<AppController> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;

  PullToRefreshController? pullToRefreshController;
  String url = "";
  double progress = 0;
  final urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Openai API Test'),
        //   actions: [
        //     IconButton(
        //         onPressed: () {
        //           // controller.controller.reload();
        //           // controller.loadweb();
        //         },
        //         icon: Icon(Icons.refresh))
        //   ],
        // ),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              currentIndex: controller.currentIndex.value,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.code),
                    label: 'OpenAI API Test',
                    tooltip: 'OpenAI API Test'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.calculate),
                    label: 'Cost Calculator',
                    tooltip: 'Cost Calculator'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Settings',
                    tooltip: 'Settings'),
              ],
              onTap: (index) {
                controller.currentIndex.value = index;
                controller.pageController.jumpToPage(index);
              },
            )),
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller.pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Tab01Page(),
                  Tab03Page(),
                  Tab02Page(),
                ],
              ),
            ),
            Obx(() => controller.isBannerAdLoaded.value == false ||
                    controller.ad == null
                ? Container(
                    width: Get.width,
                    color: Colors.black12,
                    alignment: Alignment.center,
                    height: 72.0,
                    child: Text('Banner Ad Not Loaded'),
                  )
                : Container(
                    width: Get.width,
                    height: 72.0,
                    child: AdWidget(ad: controller.ad!),
                  )),
          ],
        )));
  }
}
