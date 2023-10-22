import 'package:flutter/material.dart';
import 'package:sipfaa_app/components/disease_detection/detection_menu.dart';

class DetectionScreen extends StatefulWidget {
  const DetectionScreen({Key? key}) : super(key: key);

  @override
  State<DetectionScreen> createState() => _DetectionScreenState();
}

class _DetectionScreenState extends State<DetectionScreen> {
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
              backgroundImage: AssetImage("assets/detection.png"),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Disease Identification'),
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
      body:
      Column(
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
                child: DetectionMenu(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
