
import 'package:http/http.dart' as http;

class ForecastGraph {
  final String title;
  final String description;
  final String image;
  final String graphImage;
  final String mainTopic;

  ForecastGraph({
    required this.title,
    required this.description,
    required this.image,
    required this.graphImage,
    required this.mainTopic,
  });

  static double? predictFreshPrice(String getMonth) {
    var freshPrices = {
      "2021-09": 125.95161290321428,
      "2021-10": 127.90322580642857,
      "2021-11": 129.85483870964285,
      "2021-12": 131.806,
      "2022-01": 133.758,
      "2022-02": 135.71,
      "2022-03": 137.661,
      "2022-04": 139.613,
      "2022-05": 141.565,
      "2022-06": 143.516,
      "2022-07": 145.468,
      "2022-08": 147.419,
      "2022-09": 149.371,
      "2022-10": 151.323,
      "2022-11": 153.274,
      "2022-12": 155.226,
      "2023-01": 135.71,
      "2023-02": 159.129,
      "2023-03": 161.081,
      "2023-04": 163.032,
      "2023-05": 164.984,
      "2023-06": 166.935,
      "2023-07": 168.887,
      "2023-08": 170.839,
      "2023-09": 172.79,
      "2023-10": 174.742,
      "2023-11": 176.694,
      "2023-12": 178.645,
    };
    double? freshPrice = 0.0;

    for (var entry in freshPrices.entries) {
      if (entry.key == getMonth) {
        freshPrice = entry.value;
      }
    }

    return freshPrice;
  }

  static double? predictProcessed1Price(String getMonth) {
    var processPrices1 = {
      "2021-09": 76.5607,
      "2021-10": 77.788,
      "2021-11": 79.0154,
      "2021-12": 80.2427,
      "2022-01": 81.47,
      "2022-02": 82.6974,
      "2022-03": 83.9247,
      "2022-04": 85.1521,
      "2022-05": 86.3794,
      "2022-06": 87.6068,
      "2022-07": 88.8341,
      "2022-08": 90.0614,
      "2022-09": 91.2888,
      "2022-10": 92.5161,
      "2022-11": 93.7435,
      "2022-12": 94.9708,
      "2023-01": 96.1982,
      "2023-02": 97.4255,
      "2023-03": 98.6528,
      "2023-04": 99.8802,
      "2023-05": 101.108,
      "2023-06": 102.335,
      "2023-07": 103.562,
      "2023-08": 104.79,
      "2023-09": 106.017,
      "2023-10": 107.244,
      "2023-11": 108.472,
      "2023-12": 109.699,
    };
    double? processedPrice1 = 0.0;
    for (var entry in processPrices1.entries) {
      if (entry.key == getMonth) {
        processedPrice1 = entry.value;
      }
    }
    return processedPrice1;
  }

  static double? predictProcessed2Price(String getMonth) {
    var processPrices2 = {
      "2021-09": 48.4349,
      "2021-10": 49.3698,
      "2021-11": 50.3047,
      "2021-12": 51.2396,
      "2022-01": 52.1745,
      "2022-02": 53.1094,
      "2022-03": 54.0444,
      "2022-04": 54.9793,
      "2022-05": 55.9142,
      "2022-06": 56.8491,
      "2022-07": 57.784,
      "2022-08": 58.7189,
      "2022-09": 59.6538,
      "2022-10": 60.5887,
      "2022-11": 61.5236,
      "2022-12": 62.4585,
      "2023-01": 63.3934,
      "2023-02": 64.3283,
      "2023-03": 65.2633,
      "2023-04": 66.1982,
      "2023-05": 67.1331,
      "2023-06": 68.068,
      "2023-07": 69.0029,
      "2023-08": 69.9378,
      "2023-09": 70.8727,
      "2023-10": 71.8076,
      "2023-11": 72.7425,
      "2023-12": 73.6774,
    };
    double? processedPrice2 = 0.0;
    for (var entry in processPrices2.entries) {
      if (entry.key == getMonth) {
        processedPrice2 = entry.value;
      }
    }
    return processedPrice2;
  }

  Future getFreshPriceApi(String message) async{

    var url = Uri.parse('http://127.0.0.1:5000/marketA?month=2022-05');
    var response = await http.get(url);
    print("Fresh Price :");
    print(response);
  }

}
