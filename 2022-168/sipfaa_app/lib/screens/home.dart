import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sipfaa_app/screens/chat/chat_room.dart';
import 'package:sipfaa_app/screens/product_plan/add_inputs.dart';
import 'package:sipfaa_app/screens/disease_detection/detection_screen.dart';
import 'package:sipfaa_app/screens/wholeseller_farmer/input_farmer.dart';
import 'package:sipfaa_app/screens/wholeseller_farmer/wholesaler_farmer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget buildButton({
    required String title,
    required IconData icon,
    required VoidCallback onClicked,
  }) =>
      ElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, size: 25),
            const SizedBox(width: 16),
            Text(title),
          ],
        ),
        onPressed: onClicked,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(45),
          primary: const Color(0xff809b7b),
          onPrimary: Colors.black54,
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        toolbarHeight: 100,
        backgroundColor: Color(0xff809b7b),
        title: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Color(0xff809b7b),
              radius: 30,
              backgroundImage: AssetImage("assets/house.png"),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('SIPFAA Home'),
                Text(
                  'SIPFAA',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        elevation: 0,
      ),
      backgroundColor: const Color(0xff809b7b),
      drawer: Drawer(
        elevation: 10.0,
        child: Container(
          color: Color(0xff809b7b),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const SizedBox(height: 20),
              Container(
                child: const DrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/SIPFAA White.png"),
                      scale: 0.8,
                    ),
                  ),
                  child: SizedBox(),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    ListTile(
                      title: Row(children: const [
                        Icon(
                          Icons.home_filled,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 25.0,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13.0,
                              color: Colors.white),
                        )
                      ]),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Row(
                        children: const [
                          Icon(
                            Icons.android,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 25.0,
                          ),
                          Text(
                            'Expert Conversational AI',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13.0,
                                color: Colors.white),
                          )
                        ],
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ChatRoom(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      title: Row(
                        children: const [
                          Icon(
                            Icons.bug_report,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 25.0,
                          ),
                          Text(
                            'Disease Identification',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13.0,
                                color: Colors.white),
                          )
                        ],
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetectionScreen(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      title: Row(
                        children: const [
                          Icon(
                            Icons.handshake,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 25.0,
                          ),
                          Text(
                            'Buyer Seller Interaction Platform',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13.0,
                                color: Colors.white),
                          )
                        ],
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => BuyerSellerScreen(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      title: Row(
                        children: const [
                          Icon(
                            Icons.shopify,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 25.0,
                          ),
                          Text(
                            'Product Differentiation Plan',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13.0,
                                color: Colors.white),
                          )
                        ],
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AddUserInputsPlan(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
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
                child: Container(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/SIPFAA Black.png",
                        fit: BoxFit.cover,
                        color: Colors.white.withOpacity(0.8),
                        colorBlendMode: BlendMode.modulate,
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        "SIPFAA is a mobile software application that would assist the farmer in a smart way to maintain the pineapple cultivation.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "You can use the following features to assist your pineapple farming.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 15),
                      buildButton(
                        title: 'Expert Conversational AI',
                        icon: Icons.android,
                        onClicked: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ChatRoom(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 5),
                      buildButton(
                        title: 'Disease Identification',
                        icon: Icons.bug_report,
                        onClicked: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetectionScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 5),
                      buildButton(
                        title: 'Buyer Seller Interaction Platform',
                        icon: Icons.handshake,
                        onClicked: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => BuyerSellerScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 5),
                      buildButton(
                        title: 'Product Differentiation Plan',
                        icon: Icons.shopify,
                        onClicked: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AddUserInputsPlan(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
