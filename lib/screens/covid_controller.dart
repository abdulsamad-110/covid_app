import 'package:covid19_app/models/covid_model.dart';
import 'package:covid19_app/services/covid_service.dart';
import 'package:get/get.dart';

class CovidController extends GetxController {
 
  Rx<CovidModel?> covidData = Rx<CovidModel?>(null); 
  var isDataFetched = false.obs;

  // API get COVID data
  Future<void> getCovid() async {
    final data = await CovidService.getCovid();
    if (data != null) {
      print("${data} ==========>>>>>>>>>>> data");
      covidData.value = data;  
      isDataFetched.value = true;
    }
  }

   RxInt selectedButtonIndex = 0.obs;
  void toggleButton(int index) {
    selectedButtonIndex.value = index; 
  }

  @override
  void onInit() {
    getCovid();
    super.onInit();
  }
}
