import 'package:covid19_app/screens/covid_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class GlobalWidget extends StatelessWidget {
  GlobalWidget({
    super.key,
    required CovidController controller,
  });

  final CovidController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7.0),
      margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 18.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Global',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Obx(() {
                return GestureDetector(
                  onTap: () {
                    controller.toggleButton(0);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: controller.selectedButtonIndex.value == 0
                          ? Color(0xff2D2F2D)
                          : Colors.white,
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      'Total',
                      style: TextStyle(
                        color: controller.selectedButtonIndex.value == 0
                            ? Colors.white
                            : Colors.black,
                        fontSize: 13,
                      ),
                    ),
                  ),
                );
              }),
              const SizedBox(width: 10),
              Obx(() {
                return GestureDetector(
                  onTap: () {
                    controller.toggleButton(1);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: controller.selectedButtonIndex.value == 1
                          ? Colors.black
                          : Colors.white,
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      'New',
                      style: TextStyle(
                        color: controller.selectedButtonIndex.value == 1
                            ? Colors.white
                            : Colors.black,
                        fontSize: 13,
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
