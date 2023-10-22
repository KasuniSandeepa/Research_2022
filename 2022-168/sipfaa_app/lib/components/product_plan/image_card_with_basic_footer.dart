import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sipfaa_app/models/product_plan/forecast_graph.dart';

class ImageCardWithBasicFooter extends StatelessWidget {
  final ForecastGraph forecastGraphs;
  final String tag;
  final double imageWidth;

  ImageCardWithBasicFooter(
      {required this.forecastGraphs,
      required this.tag,
      required this.imageWidth});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double localWidth = size.width * 0.75;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Hero(
          tag: tag,
          child: Container(
            width: localWidth,
            height: 180.0,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
              // border: Border.all(
              //   width: 2
              // ),
              image: DecorationImage(
                image: AssetImage(forecastGraphs.image),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          ),
        ),
        Container(
          width: localWidth,
          margin: const EdgeInsets.only(top: 10.0),
          child: Text(
            forecastGraphs.title,
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
          ),
        ),
        Container(
          width: localWidth,
          margin: const EdgeInsets.only(top: 5.0),
          child: Text(
            '${forecastGraphs.description} ',
            style: const TextStyle(
                fontSize: 14.0,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
