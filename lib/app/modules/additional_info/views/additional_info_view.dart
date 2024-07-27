import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/additional_info_controller.dart';

class AdditionalInfoView extends GetView<AdditionalInfoController> {
  const AdditionalInfoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var author = 'Dominik Tomaszewski';
    var copyRight = 'Copyright 2024';

    return Scaffold(
      appBar: AppBar(
        title: Text('AdditionalInfoView'.tr),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Section(
                "About app".tr,
                Text(
                    "Aplikacja Mafia jest aplikacją stworzoną na potrzeby gry w mafię. Aplikacja pozwala na prowadzenie gry w mafię w sposób zautomatyzowany, a także poznanie zasad gry i ról postaci."),
                context),
            const Divider(),
            Section(
                "App authors".tr,
                Column(
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Dominik Tomaszewski',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ' - '),
                      TextSpan(text: 'Twórca aplikacji'.tr),
                    ])),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Weronika Kopyra',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ' - '),
                      TextSpan(text: 'Autor historii postaci'.tr),
                    ])),
                  ],
                ),
                context),
            const Divider(),
            Section(
                "App version".tr,
                Text(
                  "1.0.0",
                  style: TextStyle(fontSize: 20),
                ),
                context),
            Spacer(),
            Center(child: Text("© 2024 PlayEase Software")),
          ],
        ),
      ),
    );
  }
}

Widget Section(String title, Widget content, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title + ":", style: context.textTheme.labelMedium),
      SizedBox(height: 5),
      content,
      SizedBox(height: 5),
    ],
  );
}
