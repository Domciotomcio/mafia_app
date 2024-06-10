import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/locations_controller.dart';

class LocationsView extends GetView<LocationsController> {
  const LocationsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LocationsView'.tr),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/locations/map.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.darken),
              ),
            ),
          ),
          Positioned(
            top: 60,
            right: 20,
            child: MapButton(
              onPressed: () => Get.toNamed('/location/police'),
              text: 'police headquarters'.tr,
              icon: Icons.local_police_outlined,
              imagePath: 'assets/images/locations/police.jpg',
            ),
          ),
          Positioned(
            top: 400,
            right: 20,
            child: MapButton(
              onPressed: () => Get.toNamed('/location/court'),
              text: 'court'.tr,
              icon: Icons.gavel_outlined,
              imagePath: 'assets/images/locations/court.jpg',
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: MapButton(
              onPressed: () => Get.toNamed('/location/harbor'),
              text: 'harbor'.tr,
              icon: Icons.directions_boat_outlined,
              imagePath: 'assets/images/locations/harbor.jpg',
            ),
          ),
          Positioned(
            bottom: 60,
            left: 20,
            child: MapButton(
              onPressed: () => Get.toNamed('/location/warehouse'),
              text: 'warehouse'.tr,
              icon: Icons.account_balance_outlined,
              imagePath: 'assets/images/locations/warehouse.jpg',
            ),
          ),
          Positioned(
            top: 200,
            left: 20,
            child: MapButton(
              onPressed: () => Get.toNamed('/location/hospital'),
              text: 'hospital'.tr,
              icon: Icons.local_hospital_outlined,
              imagePath: 'assets/images/locations/hospital.jpg',
            ),
          ),
        ],
      ),
    );
  }
}

class MapButton extends StatelessWidget {
  const MapButton({
    super.key,
    required this.text,
    required this.icon,
    required this.imagePath,
    required this.onPressed,
  });

  final String text;
  final IconData icon;
  final String imagePath;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
        onPressed: onPressed,
        label: Text(text.tr,
            style:
                GoogleFonts.dancingScript(color: Colors.white, fontSize: 25)),
        icon: Icon(icon, color: Colors.white),
        // style: ButtonStyle(
        //   backgroundBuilder: (context, states, child) => Container(
        //     decoration: BoxDecoration(
        //       image: DecorationImage(
        //           image: AssetImage(imagePath),
        //           fit: BoxFit.cover,
        //           colorFilter: ColorFilter.mode(
        //               Colors.black.withOpacity(0.8), BlendMode.darken)),
        //       borderRadius: BorderRadius.all(Radius.circular(45)),
        //       border: Border.all(color: Colors.white, width: 2),
        //     ),
        //     child: child,
        //   ),
        // ),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
          overlayColor: WidgetStateProperty.all(Colors.black.withOpacity(0.5)),
          foregroundColor: WidgetStateProperty.all(Colors.white),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(45),
              side: BorderSide(color: Colors.white, width: 2),
            ),
          ),
        ));
  }
}
