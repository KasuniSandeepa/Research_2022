import 'package:flutter/material.dart';
import 'package:sipfaa_app/screens/wholeseller_farmer/show_farmers.dart';
import 'package:sipfaa_app/screens/wholeseller_farmer/show_wholesalers.dart';
import 'input_farmer.dart';
import 'input_wholesaler.dart';
import 'output_farmer.dart';


class BuyerSellerScreen extends StatelessWidget {
  BuyerSellerScreen({Key? key}) : super(key: key);

  final FocusNode _harvestCostFocusNode = FocusNode();
  final FocusNode _harvestMonthFocusNode = FocusNode();
  final FocusNode _biggerPineapplesFocusNode = FocusNode();
  final FocusNode _smallPineapplesFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          toolbarHeight: 130,
          backgroundColor: const Color(0xff809b7b),
          title: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Buyer Seller Interaction Platform'),
                ],
              ),
            ],
          ),
          elevation: 0,
        ),
        backgroundColor: const Color(0xff809b7b),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      height: 100,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          )),
                      child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                          child: Column(
                            children:<Widget> [
                              const SizedBox(height: 50,),
                              MainCardSeller(),
                              MainCardBuyer()
                              //  MainCardBuyerSeller(),
                            ],
                          )
                      )
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainCardSeller extends StatelessWidget {
  final Map<String, String> cardInfo = {
    'title': 'For You',
    'time': '8 min',
    'image': 'assets/images/image008.jpg',
  };

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => InputWholesalerSelection(),
                //InputFarmerSelection(),
          ),
        )
      },
      child: Container(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 60.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Text(
                  "",
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
            image: AssetImage("assets/farmer_wholesaler/farmer.jpeg"),
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
      ),
    );
  }
}

class MainCardBuyer extends StatelessWidget {
  final Map<String, String> cardInfo = {
    'title': 'For You',
    'time': '8 min',
    'image': 'assets/images/image008.jpg',
  };

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => InputFarmerSelection(),
            //builder: (context) => ShowWholesalers(),
          ),
        )
      },
      child: Container(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 60.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Text(
                  "",
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
            image: AssetImage("assets/farmer_wholesaler/wholesaler.jpeg"),
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
      ),
    );
  }
}