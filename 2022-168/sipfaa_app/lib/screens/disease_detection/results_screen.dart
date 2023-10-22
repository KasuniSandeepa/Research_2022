import 'package:flutter/material.dart';
import 'dart:io';

import 'package:sipfaa_app/components/disease_detection/detection_result.dart';


class ResultsScreen extends StatefulWidget {
  final File image;
  final String disease;
  final String description;
  final double confidence;

  const ResultsScreen({
    Key? key,
    required this.image,
    required this.disease,
    required this.description,
    required this.confidence,
  }) : super(key: key);

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
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
                Text('Identification Results'),
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
                child: DetectionResults(image: widget.image, disease: widget.disease, description: widget.description, confidence: widget.confidence,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
