import 'package:covid19_app/screens/covid_controller.dart';
import 'package:covid19_app/screens/widgets/box_container.dart';
import 'package:covid19_app/screens/widgets/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:covid19_app/screens/widgets/simpleinfo_container.dart';
import 'package:get/get.dart';

class CovidScreen extends StatelessWidget {
  const CovidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CovidController controller = Get.put(CovidController());

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 235, 236),
      appBar: AppBar(
        backgroundColor: const Color(0xff2D2F2D),
        title: const Text(
          'Covid 19 Live',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Global Widget
          GlobalWidget(controller: controller),

          // Box Container
          const BoxContainer(),

          const SizedBox(height: 10),

          // Header Container
          const SimpleInfoContainer(
            backgroundColor: Color(0xff2D2F2D),
            text1: 'Country',
            text2: 'Recover',
            text3: 'Confirmed',
            text4: 'Death',
            textColor: Colors.white,
          ),

          // List of Covid Data
          Expanded(
            child: Obx(() {
              if (controller.covidData.value == null) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.black,
                ));
              }

              return ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return SimpleInfoContainer(
                    // text1: controller.covidData.value?.toString() ?? '',
                    text2:
                        controller.covidData.value?.recovered.toString() ?? '0',
                    text3: controller.covidData.value?.cases.toString() ?? '0',
                    text4: controller.covidData.value?.deaths.toString() ?? '0',
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
