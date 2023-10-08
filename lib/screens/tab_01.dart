import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:openaiapitest/appcont.dart';

class Tab01Page extends GetView<AppController> {
  final GlobalKey webViewKey = GlobalKey();
  InAppWebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: InAppWebView(
          key: webViewKey,
          onLoadStart: (controller, url) {
            print("load start " + url.toString());
            EasyLoading.show(
                status: 'loading...',
                maskType: EasyLoadingMaskType.black,
                dismissOnTap: false);
          },
          onLoadStop: (controller, url) async {
            // print("load stop " + url.toString());
            EasyLoading.dismiss();
          },
          initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(transparentBackground: true)),
          initialUrlRequest: URLRequest(
              url: Uri.parse('http://openaiapitest.surge.sh/index.html')),
          onWebViewCreated: (controller) {
            webViewController = controller;
          },
          onLoadError: (controller, url, code, message) {
            GetSnackBar(
              title: "errro",
              message: message,
            );
          },
        ),
      ),
    );
  }
}
