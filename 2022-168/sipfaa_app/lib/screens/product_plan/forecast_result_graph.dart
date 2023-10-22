import 'package:flutter/material.dart';
import 'package:sipfaa_app/components/product_plan/image_card_with_basic_footer.dart';
import 'package:sipfaa_app/components/product_plan/main_card_programs.dart';
import 'package:sipfaa_app/models/product_plan/forecast_graph.dart';
import 'package:sipfaa_app/screens/product_plan/optimized_plan_screen.dart';
import 'package:sipfaa_app/screens/product_plan/plan_screen.dart';

import '../../components/product_plan/forecast_detail.dart';
import '../../components/product_plan/section.dart';

class ForecastResultGraphs extends StatelessWidget {
  final String month;
  final Map<String, double?> prices;
  final Map<String, dynamic> optimizationResult;
  final Map<String, dynamic> productPrices;
  final String damagedPineapple;

  //const ForecastResultGraphs({Key? key}) : super(key: key);
  ForecastResultGraphs({Key? key, required this.month, required this.prices, required this.optimizationResult, required this.productPrices, required this.damagedPineapple})
      : super(key: key);

  final List<ForecastGraph> forecastGraphs = [
    ForecastGraph(
      image: 'assets/product_plan/fresh_market_image.jpg',
      title: 'Fresh Pineapple Price Forecast',
      description: 'Next 17 months',
      graphImage: 'assets/product_plan/fresh_forecast_arima.png',
      mainTopic: 'Fresh Pineapple Market Price',
    ),
    ForecastGraph(
      image: 'assets/product_plan/process_market_1_image.jpg',
      title: 'Process Pineapple Price Forecast 1',
      description: 'Next 17 months',
      graphImage: 'assets/product_plan/process_1_forecast_arima.png',
      mainTopic: 'Process Pineapple Market 1 Price',
    ),
    ForecastGraph(
      image: 'assets/product_plan/process_market_2_image.jpg',
      title: 'Process Pineapple Price Forecast 2',
      description: 'Next 17 months',
      graphImage: 'assets/product_plan/process_2_forecast_arima.png',
      mainTopic: 'Process Pineapple Market 2 Price',
    )
  ];

  List<Widget> generateList(BuildContext context) {
    List<Widget> list = [];
    int count = 0;
    for (var forecastGraph in forecastGraphs) {
      Widget element = Container(
        margin: const EdgeInsets.only(right: 20.0),
        child: GestureDetector(
          child: ImageCardWithBasicFooter(
            forecastGraphs: forecastGraph,
            tag: 'imageHeader$count',
            imageWidth: 0.0,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) {
                  return ForecastDetail(
                    tag: 'imageHeader$count',
                    forecastGraph: forecastGraph,
                    month: month,
                    prices: prices,
                  );
                },
              ),
            );
          },
        ),
      );
      list.add(element);
      count++;
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        toolbarHeight: 130,
        backgroundColor: const Color(0xff809b7b),
        title: const Text(
          'Forecast Results',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      backgroundColor: const Color(0xff809b7b),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 800,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: Column(
                    children: <Widget>[
                      MainCardPrograms(),
                      Section(
                        title: 'Pineapple Market Price Forecasting for Framers',
                        horizontalList: generateList(context),
                      ),
                      const SizedBox(height: 40.0),
                      ElevatedButton(
                        onPressed: () async {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PlanScreen(month: month, prices: prices, optimizationResult: optimizationResult, productPrices: productPrices, damagedPineapples: damagedPineapple),
                            ),
                          );

                        },
                        style: ElevatedButton.styleFrom(
                          maximumSize: Size.infinite,
                          primary: const Color.fromARGB(255, 95, 128, 8),
                          padding: const EdgeInsets.all(15.0),
                          shadowColor: Colors.black,
                          // fixedSize: Size(10.0, 20)
                        ),
                        child: const Text(
                          'Show Differentiation Plan',
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
