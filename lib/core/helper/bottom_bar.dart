import 'package:brief_project/feature/dashboard/presentation/controller/dashboard._controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final Function(int) onTap;

  CustomBottomNavigationBar({
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    List<Color> tabColors = [
      Colors.blue,
      Colors.green
    ]; // Sesuaikan dengan jumlah tab dan warna yang diinginkan

    final controller = Get.find<DashboardConttoller>();
    return BottomNavigationBar(
      currentIndex: controller.currentIndex.value,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      iconSize: MediaQuery.of(context).size.height * 0.07,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home),
          backgroundColor: tabColors[0],
        ),
        BottomNavigationBarItem(
          label: 'Profile',
          icon: Icon(Icons.account_circle),
          backgroundColor: tabColors[1],
        ),
      ],
      onTap: (value) {
        controller.currentIndex.value = value;

        // Ubah warna latar belakang tab sesuai dengan tab yang dipilih
        for (int i = 0; i < tabColors.length; i++) {
          tabColors[i] = (i == value)
              ? Colors.blue
              : Colors.transparent; // Sesuaikan warna yang diinginkan
        }
      },
    );
  }
}
