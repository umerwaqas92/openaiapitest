import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'adhelper/adhelper.dart';

class AppController extends GetxController {
  // late WebViewController controller;
  RxBool isBannerAdLoaded = false.obs;
  RxInt currentIndex = 0.obs;
  PageController pageController = PageController();

  BannerAd? ad;

  Future<InitializationStatus> _initGoogleMobileAds() {
    // TODO: Initialize Google Mobile Ads SDK
    return MobileAds.instance.initialize();
  }

  loadBannerAd() {
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          ad = ad as BannerAd;
          if (ad != null) isBannerAdLoaded.value = true;
        },
        onAdFailedToLoad: (ad, error) {
          // Releases an ad resource when it fails to load
          ad.dispose();

          print('Ad load failed (code=${error.code} message=${error.message})');
        },
      ),
    ).load();
  }

  // loadweb() async {
  //   controller = WebViewController()
  //     ..setJavaScriptMode(JavaScriptMode.unrestricted)
  //     ..setUserAgent(
  //         'Mozilla/5.0 (Linux; Android 10; SM-G975F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Mobile Safari/537.36')
  //     ..loadRequest(Uri.parse('http://openaiapitest.surge.sh/index.html'));
  // }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _initGoogleMobileAds();
    // loadweb();

    loadBannerAd();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    try {
      ad?.dispose();
    } on Exception catch (e) {
      // TODO
    }
  }
}
