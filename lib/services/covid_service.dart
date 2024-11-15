import 'package:covid19_app/apiclient/api_client.dart';
import 'package:covid19_app/models/covid_model.dart';
import 'package:covid19_app/utils/api_constants.dart';

class CovidService {
  static final ApiClient _apiClient = ApiClient();

  // Get Api
  static Future<CovidModel?> getCovid() async {
    final response = await _apiClient.callApi(
      endpoint: AppUrl.worldStatsApi,
       method: ApiRequestMethods.get
       );
      CovidModel?  covidData;
       if(response != null) {
        print("$response ========>>>>>>> response");
       covidData  =CovidModel.fromJson(response);
       return covidData;
       }
       return null;

  }
}