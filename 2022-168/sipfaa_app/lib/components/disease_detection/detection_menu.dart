import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:giff_dialog/giff_dialog.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import '../../screens/disease_detection/results_screen.dart';

class DetectionMenu extends StatefulWidget {
  const DetectionMenu({Key? key}) : super(key: key);

  @override
  State<DetectionMenu> createState() => _DetectionMenuState();
}

class _DetectionMenuState extends State<DetectionMenu> {
  File? image;
  late File uploaded;
  bool _isProcessing = false;
  String disease = "";
  String description = "";
  double confidence = 0.0;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);

      setState(() {
        this.image = imageTemporary;
        this.uploaded = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');

      showDialog(
        context: context,
        builder: (_) => AssetGiffDialog(
          onlyOkButton: true,
          buttonOkColor: const Color(0xff809b7b),
          image: Image.asset(
            "assets/product_plan/running_pineapple.gif",
            fit: BoxFit.fill,
          ),
          title: const Text(
            "Failed to pick an image...",
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
          ),
          description: const Text(
            'Something went wrong',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 19.0),
          ),
          entryAnimation: EntryAnimation.top,
          onOkButtonPressed: () {
            setState(() {});
            Navigator.pop(context);
          },
        ),
      );
    }
  }

  Future uploadImage(String filePath) async {
    print("Here " + filePath);
    // var request = http.MultipartRequest(
    //     "POST", Uri.parse("http://192.168.1.71:8001/predict"));
    // http.MultipartRequest request = new http.MultipartRequest("POST", Uri.parse("http://10.0.2.2:8001/predict"));

    var request = http.MultipartRequest(
        "POST", Uri.parse("https://us-central1-sipfaa-disease-identification.cloudfunctions.net/predict"));
    request.files.add(await http.MultipartFile.fromPath('file', filePath));

    var response = await request.send();
    print("request sent");

    if (response.statusCode == 200) {
      print("inside if 200 response");
      var res = await http.Response.fromStream(response);
      var data = await jsonDecode(res.body);

      setState(() {
        disease = data["predicted_class"];
        description = data["description"];
        confidence = data["confidence"];
      });

      print(_isProcessing);
    } else {
      print("Error");

      showDialog(
        context: context,
        builder: (_) => AssetGiffDialog(
          onlyOkButton: true,
          buttonOkColor: const Color(0xff809b7b),
          image: Image.asset(
            "assets/product_plan/running_pineapple.gif",
            fit: BoxFit.fill,
          ),
          title: const Text(
            "Processing...",
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
          ),
          description: const Text(
            'Something went wrong',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 19.0),
          ),
          entryAnimation: EntryAnimation.top,
          onOkButtonPressed: () {
            Navigator.pop(context);
          },
        ),
      );
    }
  }

  Widget buildButton({
    required String title,
    required IconData icon,
    required VoidCallback onClicked,
  }) =>
      ElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28),
            const SizedBox(width: 16),
            Text(title),
          ],
        ),
        onPressed: onClicked,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(56),
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
    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          image != null
              ? Image.file(
                  image!,
                  width: 180,
                  height: 180,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  'assets/pineapple.png',
                  height: 180,
                  width: 180,
                  fit: BoxFit.cover,
                ),
          const SizedBox(height: 30),
          (image == null)
              ? const Text(
                  'Use below options to upload the image',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Container(),
          const SizedBox(height: 20),
          buildButton(
            title: 'Capture with Camera',
            icon: Icons.camera_alt_outlined,
            onClicked: () => pickImage(ImageSource.camera),
          ),
          const SizedBox(height: 20),
          buildButton(
            title: 'Pick from the Gallery',
            icon: Icons.image_outlined,
            onClicked: () => pickImage(ImageSource.gallery),
          ),
          const SizedBox(height: 20),
          if (image != null)
            ElevatedButton(
              onPressed: () async {
                if (image != null) {
                  setState(() {
                    _isProcessing = true;
                  });
                }

                await uploadImage(image!.path);

                if (disease == "Pineapple Wilt") {
                  await showDialog(
                    context: context,
                    builder: (_) => AssetGiffDialog(
                      buttonOkColor: Color(0xff809b7b),
                      image: Image.asset(
                        "assets/disease_identification/leaf_fold.gif",
                        fit: BoxFit.fill,
                      ),
                      title: const Text(
                        "Need your observation!",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      description: const Text(
                        "Could you please fold a pineapple leaf.\nIf you can hear a sound, hit 'OK'. If not hit 'Cancel'.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      entryAnimation: EntryAnimation.top,
                      onOkButtonPressed: () {
                        setState(() {
                          _isProcessing = false;
                          disease = "Healthy";
                          description =
                              "This occurs due to high sun light condition and can be cured.";
                          confidence = 1;

                          Navigator.pop(context);
                        });
                      },
                      onCancelButtonPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  );
                }

                setState(() {
                  _isProcessing = false;

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ResultsScreen(
                        image: uploaded,
                        disease: disease,
                        description: description,
                        confidence: confidence,
                      ),
                    ),
                  );
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _isProcessing
                      ? const CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.blue),
                        )
                      : const Icon(Icons.search_outlined, size: 28),
                  const SizedBox(width: 16),
                  const Text("Check the Image"),
                ],
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(56),
                primary: const Color(0xff809b7b),
                onPrimary: Colors.black54,
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
        ],
      ),
    );
  }
}

class Result {
  String? predictedClass;
  String? description;
  double? confidence;

  Result({this.predictedClass, this.description, this.confidence});

  Result.fromJson(Map<String, dynamic> json) {
    predictedClass = json['predicted_class'];
    description = json['description'];
    confidence = json['confidence'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['predicted_class'] = this.predictedClass;
    data['description'] = this.description;
    data['confidence'] = this.confidence;
    return data;
  }
}
