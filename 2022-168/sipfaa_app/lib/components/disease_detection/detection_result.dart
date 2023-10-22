import 'package:flutter/material.dart';
import 'dart:io';

class DetectionResults extends StatefulWidget {
  final File image;
  final String disease;
  final double confidence;
  final String description;

  const DetectionResults({
    Key? key,
    required this.image,
    required this.disease,
    required this.description,
    required this.confidence,
  }) : super(key: key);

  @override
  State<DetectionResults> createState() => _DetectionResultsState();
}

class _DetectionResultsState extends State<DetectionResults> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Disease Detected:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.disease,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Card(
                    color: Color.fromRGBO(229, 229, 229, 0.35),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Container(
                      height: 40.0,
                      width: 100.0,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            (widget.disease == "Invalid Image")
                                ? const Icon(
                                    Icons.circle_rounded,
                                    color: Colors.black,
                                  )
                                : (widget.disease == "Healthy")
                                    ? const Icon(
                                        Icons.circle_rounded,
                                        color: Colors.green,
                                      )
                                    : const Icon(
                                        Icons.circle_rounded,
                                        color: Colors.red,
                                      ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: (widget.disease == "Invalid Image")
                                  ? const Text(
                                      'Invalid',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                        fontSize: 16.0,
                                      ),
                                    )
                                  : (widget.disease == "Healthy")
                                      ? const Text(
                                          'Healthy',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54,
                                            fontSize: 16.0,
                                          ),
                                        )
                                      : const Text(
                                          'Infected',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54,
                                            fontSize: 16.0,
                                          ),
                                        ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  (widget.disease == "Invalid Image")
                      ? const Text('')
                      : Text(
                          widget.confidence.toString() + "%",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )
                ],
              )
            ],
          ),
          SizedBox(height: 20),
          Image.file(
            widget.image,
            fit: BoxFit.cover,
            height: 300,
            width: 256,
          ),
          SizedBox(height: 20),
          Card(
            color: Color(0xff809b7b),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  widget.description,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
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
