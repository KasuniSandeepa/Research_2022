import 'package:flutter/material.dart';

class MainCardPrograms extends StatelessWidget {
  final Map<String, String> cardInfo = {
    'title': 'For You',
    'time': '8 min',
    'image': 'assets/images/image008.jpg',
  };

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              Text(
                "Pineapple Trend Analysis",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.grey[400]?.withOpacity(0),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
        ),
      ),
      width: size.width - 40,
      height: (size.width - 30) / 2,
      margin: const EdgeInsets.only(
        top: 40.0,
        left: 20.0,
        right: 20.0,
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/product_plan/pineapple_image_1.jpg"),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
        color: Colors.white70,
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 25.0,
            offset: Offset(8.0, 8.0),
          ),
        ],
      ),
    );
  }
}
