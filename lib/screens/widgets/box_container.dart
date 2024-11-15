import 'package:covid19_app/screens/covid_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoxContainer extends StatelessWidget {
  const BoxContainer({super.key});

  @override
  Widget build(BuildContext context) {
    CovidController controller = Get.find<CovidController>();

    return Center(
      child: Container(
        width: 315,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Obx(() {
          if (!controller.isDataFetched.value) {
            
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
          final covidData = controller.covidData.value;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InfoBox(
                    title: 'Confirmed',
                    count: covidData?.cases.toString() ?? '0',
                    color: Colors.orange,
                  ),
                  const SizedBox(width: 10),
                  InfoBox(
                    title: 'Active',
                    count: covidData?.active.toString() ?? '0',
                    color: Colors.lightBlue,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InfoBox(
                    title: 'Recovered',
                    count: covidData?.recovered.toString() ?? '0',
                    color: Colors.lightGreen,
                  ),
                  const SizedBox(width: 10),
                  InfoBox(
                    title: 'Deaths',
                    count: covidData?.deaths.toString() ?? '0',
                    color: const Color.fromARGB(255, 241, 48, 48),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}

// InfoBox widget
class InfoBox extends StatelessWidget {
  final String title;
  final String count;
  final Color color;

  const InfoBox({
    super.key,
    required this.title,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 142,
      height: 90,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          Text(
            count,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
