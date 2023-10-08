import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:openaiapitest/appcont.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Tab02Page extends GetView<AppController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Settings',
            style: TextStyle(color: Colors.black87),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
            child: ListView(
          children: [
            // share app
            ListTile(
              leading: Icon(Icons.share),
              trailing: Icon(Icons.arrow_forward_ios),
              title: Text('Share App'),
              onTap: () {
                var appurl =
                    "https://play.google.com/store/apps/details?id=com.openaiapitest";
                Share.share(appurl);
              },
            ),
            // rate app
            ListTile(
              leading: Icon(Icons.star),
              trailing: Icon(Icons.arrow_forward_ios),
              title: Text('Rate App'),
              onTap: () {
                var appurl =
                    "https://play.google.com/store/apps/details?id=com.openaiapitest";
                final Uri _url = Uri.parse(appurl);

                launchUrl(_url);
              },
            ),
            // privacy policy
            ListTile(
              leading: Icon(Icons.privacy_tip),
              trailing: Icon(Icons.arrow_forward_ios),
              title: Text('Privacy Policy'),
              onTap: () {
                var appurl =
                    "https://openaiapitest.surge.sh/privacy_policy.html";
                final Uri _url = Uri.parse(appurl);

                launchUrl(_url);
              },
            ),

            // more apps
            ListTile(
              leading: Icon(Icons.apps),
              trailing: Icon(Icons.arrow_forward_ios),
              title: Text('More Apps'),
              onTap: () {
                var appurl =
                    "https://play.google.com/store/apps/developer?id=fluttydev";
                final Uri _url = Uri.parse(appurl);

                launchUrl(_url);
              },
            ),
            // contact us
            ListTile(
                leading: Icon(Icons.contact_mail),
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text('Contact Us'),
                onTap: () {
                  var appurl = "mailto:um.waqas.khan@gmail.com";
                  final Uri _url = Uri.parse(appurl);
                  launchUrl(_url);
                })
          ],
        )));
  }
}
