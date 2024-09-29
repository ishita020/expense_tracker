import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../homepage_controller/homepage_controller.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomepageController homepageController = Get.put(HomepageController());
    return Scaffold(
        appBar: AppBar(
          title: Obx(
            () => Text(
              homepageController
                  .screenTitles[homepageController.selectedIndex.value],
              style: TextStyle(color: Colors.white),
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.blueAccent,
        ),
        body: Obx(() => Container(
            child: homepageController
                .screens[homepageController.selectedIndex.value])),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
              currentIndex: homepageController.selectedIndex.value,
              onTap: (value) {
                homepageController.selectedIndex.value = value;
              },
              selectedItemColor: Colors.grey,
              selectedLabelStyle: TextStyle(fontSize: 15),
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Profile"),
              ]),
        ));
  }
}
