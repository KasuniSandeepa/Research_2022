import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sipfaa_app/screens/wholeseller_farmer/output_farmer.dart';
import 'package:sipfaa_app/screens/wholeseller_farmer/show_wholesalers.dart';

import '../providers/wholeseller_farmer_provider.dart';
import '../screens/wholeseller_farmer/output_wholesaler.dart';

class InputWholesalerSelectionForm extends StatefulWidget {

  final FocusNode pineapplePriceRangeFocusNode;
  final FocusNode pineappleQuantityRangeFocusNode;
  final FocusNode pineappleTasteQualityRangeFocusNode;
  final FocusNode pineappleRateRangeFocusNode;

  const InputWholesalerSelectionForm({Key? key,
    required this.pineapplePriceRangeFocusNode,
    required this.pineappleQuantityRangeFocusNode,
    required this.pineappleTasteQualityRangeFocusNode,
    required this.pineappleRateRangeFocusNode
  }) : super(key: key);

  @override
  State<InputWholesalerSelectionForm> createState() => _InputWholesalerSelectionFormState();
}

class _InputWholesalerSelectionFormState extends State<InputWholesalerSelectionForm> {
  String currentAddress = 'My Address';
  //late Position currentposition;
  final _inputfarmerSelectionFormKey = GlobalKey<FormState>();
  bool _isProcessing = false;
  bool serviceStatus = false;
  bool hasPermission = false;
  late LocationPermission permission;
  late Position position;
  String long = "", lat = "";
  late StreamSubscription<Position> positionStream;
  final  List<String> tasteQuality = ['High', 'Average', 'Low'];
  final  List<String> price = ['Very High', 'High', 'Average', 'Low'];
  final  List<String> quantity = ['Very High', 'High', 'Average', 'Low'];

  var getPrice = "";
  var getQuantity = "";
  var getTasteQuality = "";
  var getRate = 0;
  // SingingCharacter? _character = SingingCharacter.lafayette;
  int val = -1;
  RangeValues _currentPriceRangeValues = const RangeValues(120, 200);
  RangeValues _currentQuantityRangeValues = const RangeValues(0, 80);

  void initState() {
    checkGps();
    super.initState();
  }

  checkGps() async {
    serviceStatus = await Geolocator.isLocationServiceEnabled();
    if(serviceStatus){
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
        }else if(permission == LocationPermission.deniedForever){
          print("'Location permissions are permanently denied");
        }else{
          hasPermission = true;
        }
      }else{
        hasPermission = true;
      }
      if(hasPermission){
        setState(() {
          //refresh the UI
          });
          getLocation();
          }}
          else{
          print("GPS Service is not enabled, turn on GPS location");
          }
          setState(() {
            //refresh the UI
          }
          );
  }

  getLocation() async {
    position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position.longitude);
    print(position.latitude);
    long = position.longitude.toString();
    lat = position.latitude.toString();
    print("latttttt"+position.latitude.toString());
    setState(() {
   // refresh UI
    });
    LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
    );
    StreamSubscription<Position> positionStream = Geolocator.getPositionStream(
      locationSettings: locationSettings).listen((Position position) {
      print(position.longitude);
      print(position.latitude);
      long = position.longitude.toString();
      lat = position.latitude.toString();
      setState(() {
        //refresh UI on update
        }
        );
        }
        );
        }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Form(
            key: _inputfarmerSelectionFormKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8.0),
                    const Text(
                      "Price Range",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19.0,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8.0),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.yellowAccent),
                        hintStyle: const TextStyle(color: Colors.grey),
                        errorStyle: const TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Colors.amberAccent,
                              width: 2,
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            )),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Colors.redAccent,
                              width: 2,
                            )),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Colors.redAccent,
                            width: 2,
                          ),
                        ),
                      ),
                      onChanged: (val) {
                        setState(() => getPrice = val.toString());
                      },
                      hint: Text('Select Price Range'),
                      validator: (val) {
                        if (val == null || val.toString().isEmpty) {
                          return 'Select Price Range';
                        }
                      },
                      items: price.map((account) {
                        return DropdownMenuItem(
                          child: Text(account),
                          value: account,
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 8.0),
                    const Text(
                      "Quantity",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19.0,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8.0),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.yellowAccent),
                        hintStyle: const TextStyle(color: Colors.grey),
                        errorStyle: const TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Colors.amberAccent,
                              width: 2,
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            )),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Colors.redAccent,
                              width: 2,
                            )),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Colors.redAccent,
                            width: 2,
                          ),
                        ),
                      ),
                      onChanged: (val) {
                        setState(() => getQuantity = val.toString());
                      },
                      hint: Text('Select Quantity Range'),
                      validator: (val) {
                        if (val == null || val.toString().isEmpty) {
                          return 'Select Quantity Range';
                        }
                      },
                      items: quantity.map((account) {
                        return DropdownMenuItem(
                          child: Text(account),
                          value: account,
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 8.0),
                    const Text(
                      "Taste Quality",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19.0,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8.0),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.yellowAccent),
                        hintStyle: const TextStyle(color: Colors.grey),
                        errorStyle: const TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Colors.amberAccent,
                              width: 2,
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            )),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Colors.redAccent,
                              width: 2,
                            )),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Colors.redAccent,
                            width: 2,
                          ),
                        ),
                      ),
                      onChanged: (val) {
                        setState(() => getTasteQuality = val.toString());
                      },
                      hint: Text('Select Taste Quality'),
                      validator: (val) {
                        if (val == null || val.toString().isEmpty) {
                          return 'Select Taste Quality';
                        }
                      },
                      items: tasteQuality.map((account) {
                        return DropdownMenuItem(
                          child: Text(account),
                          value: account,
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      "Ratings",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19.0,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        Radio(
                          value: 1,
                          onChanged: (value) {
                            setState(() {
                              val = value as int;
                              getRate = val;
                            });
                          },
                          groupValue: val,
                          activeColor: Colors.yellow,
                        ),
                        const Text(
                          "High",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              letterSpacing: 1),
                        ),
                        const SizedBox(width: 140.0),
                        Radio(
                          value: 0,
                          onChanged: (value) {
                            setState(() {
                              val = value as int;
                              getRate = val;
                            });
                          },
                          groupValue: val,
                          activeColor: Colors.yellow,
                        ),
                        const Text(
                          "Low",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              letterSpacing: 1),
                        ),
                      ],
                    ),
                    // const Text(
                    //   "Location",
                    //   style: TextStyle(
                    //       color: Colors.black,
                    //       fontSize: 19.0,
                    //       letterSpacing: 1,
                    //       fontWeight: FontWeight.bold),
                    // ),
                    const SizedBox(height: 15.0),

                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        height: 60, //height of button
                        width: 120,
                        child: ElevatedButton(
                            onPressed: () async {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => WholesalerOutput(rating: getRate, quantityRange: getQuantity, tasteQuality: getTasteQuality, priceRang: getPrice,lat: position.latitude.toString(), long: position.longitude.toString())
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              //maximumSize: Size.infinite,
                              primary: Color(0xff809b7b),
                              //fixedSize: Size(10.0, 20)
                            ),
                            child:
                            const Text(
                              'Go',
                              style: TextStyle(fontSize: 25),
                            )

                        ),//width of button

                      ),
                    )

                  ]),
            )));

  }
}

