import 'package:flutter/material.dart';
import 'package:sipfaa_app/components/product_plan/prodcut_card_with_basic_footer.dart';
import 'package:sipfaa_app/components/product_plan/section.dart';
import 'package:sipfaa_app/models/product_plan/Product.dart';

class PlanScreen extends StatelessWidget {

  final String month;
  final String damagedPineapples;
  final Map<String, double?> prices;
  final Map<String, dynamic> optimizationResult;
  final Map<String, dynamic> productPrices;
  List<Product> products;

  PlanScreen({
    Key? key,
    required this.month,
    required this.prices,
    required this.optimizationResult,
    required this.productPrices,
    required this.damagedPineapples,
  }) : products = [
    Product(
      image: 'assets/product_plan/pineapple_juice.jpg',
      title: 'Pineapple Juice',
      description: 'Current Price: '+productPrices["juicePrice"],
      mainTopic: '1L',
    ),
    Product(
      image: 'assets/product_plan/pineapple_jam.jpg',
      title: 'Pineapple Jam',
      description: 'Current Price: '+productPrices["jamPrice"],
      mainTopic: '300g',
    ),
    Product(
      image: 'assets/product_plan/pineapple_chunk.jpg',
      title: 'Pineapple Chunk',
      description: 'Current Price: '+productPrices["chunkPrice"],
      mainTopic: '500g',
    ),
    Product(
      image: 'assets/product_plan/pineapple_chutney.jpg',
      title: 'Pineapple Chutney',
      description: 'Current Price: '+productPrices["chutneyPrice"],
      mainTopic: '350g',
    ),
    Product(
      image: 'assets/product_plan/pineapple_sause.jfif',
      title: 'Pineapple Sauce',
      description: 'Current Price: '+productPrices["sausePrice"],
      mainTopic: '260ml',
    ),
    Product(
      image: 'assets/product_plan/pineapple_stciks.jfif',
      title: 'Pineapple Sticks',
      description: 'Current Price: '+productPrices["stickPrice"],
      mainTopic: '24',
    ),
    Product(
      image: 'assets/product_plan/pineapple_chunks_syrup.jfif',
      title: 'Pineapple Chunks in Syrup',
      description: 'Current Price: '+productPrices["chunkSyrupPrice"],
      mainTopic: '425g',
    )

  ];

  List<Widget> generateList(BuildContext context) {
    List<Widget> list = [];
    int count = 0;
    for (var product in products) {
      Widget element = Container(
        margin: const EdgeInsets.only(right: 20.0),
        child: GestureDetector(
          child: ProductCardWithBasicFooter(
            product: product,
            tag: 'imageHeader$count',
            imageWidth: 0.0,
          ),
          onTap: () {
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
    var width = MediaQuery.of(context).size.width;
    double? FreshPrice = prices["Fresh"];


    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        toolbarHeight: 130,
        backgroundColor: const Color(0xff809b7b),
        title: const Text(
          'Product Differentiation Plan',
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
              SingleChildScrollView(
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 800,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        )),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 13,
                          ),
                          Container(
                            color: Colors.white,
                            padding:
                                const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 35.0),
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    useSafeArea: true,

                                    // barrierColor: Colors.black,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                          //insetPadding: EdgeInsets.all(5),
                                          shape: const RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: Colors.black, width: 5),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                          ),
                                          title: const Text('Optimal Outcome'),
                                          content: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                children: <Widget>[
                                                  Container(
                                                    width: width * 0.30 - 5.0,
                                                    height: 100.0,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 10.0),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            25.0),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromRGBO(
                                                              231,
                                                              241,
                                                              255,
                                                              1.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Flexible(
                                                          child: Container(
                                                            margin:
                                                                const EdgeInsets.only(
                                                                    right:
                                                                        10.0),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: const <
                                                                  Widget>[
                                                                Text(
                                                                  'Total Income',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        15.0,
                                                                    color: Colors
                                                                        .black54,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    width: width * 0.40 - 10.0,
                                                    height: 100.0,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            25.0),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromRGBO(
                                                              241,
                                                              227,
                                                              255,
                                                              1.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Text(
                                                          "Rs. "+ optimizationResult["totalIncome"].toString(),
                                                          style: const TextStyle(
                                                            fontSize: 16.0,
                                                            color:
                                                                Color.fromRGBO(
                                                                    190,
                                                                    129,
                                                                    255,
                                                                    1.0),
                                                            fontWeight:
                                                                FontWeight.w900,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Container(
                                                    width: width * 0.30 - 5.0,
                                                    height: 100.0,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 10.0),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            25.0),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromRGBO(
                                                              231,
                                                              241,
                                                              255,
                                                              1.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Flexible(
                                                          child: Container(
                                                            margin:
                                                                const EdgeInsets.only(
                                                                    right:
                                                                        10.0),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: const <
                                                                  Widget>[
                                                                Text(
                                                                  'Total Profit',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        15.0,
                                                                    color: Colors
                                                                        .black54,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    width: width * 0.40 - 10.0,
                                                    height: 100.0,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            25.0),
                                                    decoration: BoxDecoration(
                                                      color: const Color.fromRGBO(
                                                          241, 227, 255, 1.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Text(
                                                          "Rs. "+optimizationResult["totalProfit"].toString(),
                                                          style: const TextStyle(
                                                            fontSize: 16.0,
                                                            color:
                                                                Color.fromRGBO(
                                                                    190,
                                                                    129,
                                                                    255,
                                                                    1.0),
                                                            fontWeight:
                                                                FontWeight.w900,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                              (optimizationResult["totalProfit"]>0) ? Container(
                                                padding: const EdgeInsets.all(15.0),
                                                decoration: BoxDecoration(
                                                  color: const Color.fromRGBO(15, 163, 15, 1.0),
                                                  borderRadius: BorderRadius.circular(15.0),
                                                ),
                                                child:
                                                  Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: const <Widget>[
                                                    Expanded(
                                                      child: Text(
                                                        'Success ! It is a profit.',
                                                        style: TextStyle(
                                                          color:
                                                          Color.fromRGBO(245, 252, 245, 1.0),
                                                          fontSize: 15.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ):
                                              Container(
                                                padding: const EdgeInsets.all(15.0),
                                                decoration: BoxDecoration(
                                                  color: const Color.fromRGBO(163, 5, 10, 1.0),
                                                  borderRadius: BorderRadius.circular(15.0),
                                                ),
                                                child:
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: const <Widget>[
                                                    Expanded(
                                                      child: Text(
                                                        'Oops! It is a loss.',
                                                        style: TextStyle(
                                                          color:
                                                          Color.fromRGBO(245, 252, 245, 1.0),
                                                          fontSize: 15.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 40),
                                              GestureDetector(
                                                onTap: () {
                                                  showDialog(
                                                      context: context,
                                                      useSafeArea: true,

                                                      // barrierColor: Colors.black,
                                                      builder: (BuildContext context) =>
                                                          AlertDialog(
                                                            //insetPadding: EdgeInsets.all(5),
                                                            shape: const RoundedRectangleBorder(
                                                              side: BorderSide(
                                                                  color: Colors.black, width: 5),
                                                              borderRadius: BorderRadius.all(
                                                                Radius.circular(20),
                                                              ),
                                                            ),
                                                            title: const Text('Product Plan'),
                                                            content: Column(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.end,
                                                              mainAxisSize: MainAxisSize.max,
                                                              children: [

                                                                Container(
                                                                  padding: const EdgeInsets.all(15.0),
                                                                  decoration: BoxDecoration(
                                                                    color: Color.fromRGBO(241, 227, 255, 1.0),
                                                                    borderRadius: BorderRadius.circular(15.0),
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                    MainAxisAlignment.spaceBetween,
                                                                    children: const <Widget>[
                                                                      Expanded(
                                                                        child: Text(
                                                                          'You can try the below product plans on your own using damaged pineapples.',
                                                                    textAlign: TextAlign.center,
                                                                          style: TextStyle(
                                                                            color:
                                                                             Colors
                                                                            .black54,
                                                                            fontWeight:
                                                                            FontWeight
                                                                                .w900,
                                                                            fontSize: 15.0,
                                                                          ),

                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                const SizedBox(height: 15),
                                                                Section(
                                                                  title:
                                                                      'Current Market Prices are shown below',
                                                                  horizontalList:
                                                                      generateList(context),
                                                                ),
                                                              ],
                                                            ),
                                                            actions: <Widget>[
                                                              IconButton(
                                                                  icon: new Icon(Icons.close),
                                                                  onPressed: () {
                                                                    Navigator.pop(context);
                                                                  })
                                                            ],
                                                          ));
                                                },
                                                child: Container(
                                                  padding: const EdgeInsets.all(20.0),
                                                  decoration: BoxDecoration(
                                                    color: Color.fromRGBO(231, 241, 255, 1.0),
                                                    borderRadius: BorderRadius.circular(15.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                    children:  <Widget>[
                                                      Expanded(
                                                        child: Text(
                                                          'Amount of Damaged Pineapple : '+damagedPineapples+'  \n\n\n Tap here to see',
                                                          textAlign: TextAlign.center,
                                                          style: const TextStyle(
                                                            color: Colors
                                                                .black54,
                                                            fontWeight:
                                                            FontWeight
                                                                .w900,
                                                            fontSize: 18.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          actions: <Widget>[
                                            IconButton(
                                                icon: new Icon(Icons.close),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                })
                                          ],
                                        ));
                              },
                              child: Container(
                                padding: const EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(241, 227, 255, 1.0),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const <Widget>[
                                    Text(
                                      'Optimal Outcome ',
                                      style: TextStyle(
                                        color:
                                            Color.fromRGBO(190, 130, 255, 1.0),
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    Text(
                                      'Press Here',
                                      style: TextStyle(
                                        color:
                                            Color.fromRGBO(190, 130, 255, 1.0),
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 25.0,
                              horizontal: 20.0,
                            ),
                            width: 950,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(231, 241, 248, 1.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // const SizedBox(height: 13,),
                                Align(
                                    alignment: Alignment.topCenter,
                                    child: SizedBox(
                                        height: 50.0,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const <Widget>[
                                            Text(
                                              "For Fresh Market",
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ))),
                                Container(
                                  padding: const EdgeInsets.all(30.0),
                                  margin: const EdgeInsets.only(
                                      top: 0.0, bottom: 20.0),
                                  height: 130.0,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 86, 158, 62),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Flexible(
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              right: 20.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              const Text(
                                                'Quantity (Kg)',
                                                style: TextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                optimizationResult["freshQuantity"].toString(),
                                                style: const TextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              right: 20.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              const Text(
                                                'Price Per Kg (Rs)',
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                prices["Fresh"].toString(),
                                                style: const TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              right: 10.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              const Text(
                                                'Income (Rs)',
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                optimizationResult["freshMarketIncome"].toString(),
                                                style: const TextStyle(
                                                  fontSize: 13.0,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.topCenter,
                                    child: Container(
                                        height: 50.0,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const <Widget>[
                                            Text(
                                              "For Process Market A",
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ))),
                                Container(
                                  padding: const EdgeInsets.all(30.0),
                                  margin: const EdgeInsets.only(
                                      top: 0.0, bottom: 20.0),
                                  height: 130.0,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 167, 245, 66),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Flexible(
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              right: 20.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              const Text(
                                                'Quantity (Kg)',
                                                style: TextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.black),
                                              ),
                                              Text(
                                                optimizationResult["processQuantityA"].toString(),
                                                style: const TextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              right: 20.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              const Text(
                                                'Price Per Kg (Rs)',
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                prices["Processed1"].toString(),
                                                style: const TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              right: 10.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              const Text(
                                                'Income (Rs)',
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                optimizationResult["ProcessMarketIncomeA"].toString(),
                                                style: const TextStyle(
                                                  fontSize: 13.0,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.topCenter,
                                    child: SizedBox(
                                        height: 50.0,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const <Widget>[
                                            Text(
                                              "For Process Market B",
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ))),
                                Container(
                                  padding: const EdgeInsets.all(30.0),
                                  margin: const EdgeInsets.only(
                                      top: 0.0, bottom: 20.0),
                                  height: 130.0,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 66, 245, 141),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Flexible(
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              right: 20.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              const Text(
                                                'Quantity (Kg)',
                                                style: TextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.black),
                                              ),
                                              Text(
                                                optimizationResult["processQuantityB"].toString(),
                                                style: const TextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              right: 20.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              const Text(
                                                'Price Per Kg (Rs)',
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                prices["Processed2"].toString(),
                                                style: const TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              right: 10.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              const Text(
                                                'Income (Rs)',
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                optimizationResult["ProcessMarketIncomeB"].toString(),
                                                style: const TextStyle(
                                                  fontSize: 13.0,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
