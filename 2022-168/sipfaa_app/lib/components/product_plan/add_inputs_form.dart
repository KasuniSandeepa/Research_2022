import 'dart:convert';
import 'dart:ffi';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sipfaa_app/models/product_plan/optimization.dart';
import 'package:sipfaa_app/providers/plan_provider.dart';
import 'package:sipfaa_app/screens/product_plan/forecast_result_graph.dart';
import 'package:giff_dialog/giff_dialog.dart';
import 'package:http/http.dart' as http;

const ip = "http://192.168.8.118:5000";
const herokuIp = "https://sipfaa-plan-v3.herokuapp.com";
const herokuChromeIp = "https://sipfaa-plan-chrome-v2.herokuapp.com";

class AddInputsPlanForm extends StatefulWidget {
  final FocusNode harvestCostFocusNode;
  final FocusNode harvestMonthFocusNode;
  final FocusNode biggerPineapplesFocusNode;
  final FocusNode smallPineapplesFocusNode;
  final FocusNode damagedPineapplesFocusNode;

  const AddInputsPlanForm({
    Key? key,
    required this.harvestCostFocusNode,
    required this.harvestMonthFocusNode,
    required this.biggerPineapplesFocusNode,
    required this.smallPineapplesFocusNode,
    required this.damagedPineapplesFocusNode,
  }) : super(key: key);

  @override
  _AddInputsPlanFormState createState() => _AddInputsPlanFormState();
}

class _AddInputsPlanFormState extends State<AddInputsPlanForm> {
  final _addInputsFormKey = GlobalKey<FormState>();
  bool _isProcessing = false;

  final TextEditingController _harvestCostController = TextEditingController();
  final TextEditingController _harvestMonthController = TextEditingController();
  final TextEditingController _harvestbiggerPineappleController =
      TextEditingController();
  final TextEditingController _harvestSmallPineappleController = TextEditingController();
  final TextEditingController _harvestDamagedPineappleController = TextEditingController();

  Future getFreshPriceApi(String getMonth) async{
    //var res = <Response>[];
    print("getMonth : ");
    print(getMonth);

    var url = Uri.parse('$herokuIp/marketA');
    var response = await http.get(url,headers: {"month": getMonth});
    print("Fresh Price : ");
    print(response.body);
    double price= json.decode(response.body);
    return price;
  }

  Future getProcessPrice1Api(String getMonth) async{
    //var res = <Response>[];
    print("getMonth : ");
    print(getMonth);

    var url = Uri.parse('$herokuIp/marketB');
    var response = await http.get(url,headers: {"month": getMonth});
    print("Fresh Price : ");
    print(response.body);
    double price= json.decode(response.body);
    return price;
  }

  Future getProcessPrice2Api(String getMonth) async{
    //var res = <Response>[];
    print("getMonth : ");
    print(getMonth);

    //DateTime dt = DateTime.parse(getMonth);
    var url = Uri.parse('$herokuIp/marketC');
    var response = await http.get(url,headers: {"month": getMonth});
    print("Fresh Price : ");
    print(response.body);
    double price= json.decode(response.body);
    return price;
  }

  Future getOptimizationResult(String cost, String month, String quantityB, String quantityS) async{
    //var res = <Response>[];
    print("getMonth : ");
    print(month);
    Iterable res = <OptimizationResult>[];
    //DateTime dt = DateTime.parse(getMonth);
    var url = Uri.parse('$herokuIp/optimization');
    var response = await http.get(url,headers: {"cost": cost , "month": month , "quantityB":quantityB, "quantityS": quantityS});
    print("Optimization : ");
    print(json.decode(response.body));
    Map<String, dynamic> result = json.decode(response.body);
    return result;
  }

  Future getProductPrices1(String quantityS) async{
    //var res = <Response>[];
    print("getMonth : ");

    Iterable res = <OptimizationResult>[];
    var url = Uri.parse('$herokuChromeIp/getProductPrices1');
    var response = await http.get(url,headers: {"quantityD": quantityS});
    print("Optimization : ");
    print(response.statusCode);
    if(response.statusCode == 503){
      Map<String, dynamic> result = {"none":"none"};
     return result;
    }
    print(response.body);
    print(json.decode(response.body));
    Map<String, dynamic> result = json.decode(response.body);
    return result;
  }

  Future getProductPrices2(String quantityS) async{
    //var res = <Response>[];
    print("getMonth : ");

    Iterable res = <OptimizationResult>[];
    var url = Uri.parse('$herokuChromeIp/getProductPrices2');
    var response = await http.get(url,headers: {"quantityD": quantityS});
    print("Optimization : ");
    print(response.statusCode);
    if(response.statusCode == 503){
      Map<String, dynamic> result = {"none":"none"};
      return result;
    }
    print(response.body);
    print(json.decode(response.body));
    Map<String, dynamic> result = json.decode(response.body);
    return result;
  }

  Future getProductPrices3(String quantityS) async{
    //var res = <Response>[];
    print("getMonth : ");

    Iterable res = <OptimizationResult>[];
    var url = Uri.parse('$herokuChromeIp/getProductPrices3');
    var response = await http.get(url,headers: {"quantityD": quantityS});
    print("Optimization : ");
    print(response.statusCode);
    if(response.statusCode == 503){
      Map<String, dynamic> result = {"none":"none"};
      return result;
    }
    print(response.body);
    print(json.decode(response.body));
    Map<String, dynamic> result = json.decode(response.body);
    return result;
  }
  String getCost = "";
  String getMonth = "";
  String getQuantityBiggerGreen = "";
  String getQuantitySmallGreen = "";
  String getQuantityDamaged = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Form(
            key: _addInputsFormKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8.0),
                    const Text(
                      "Enter Cost",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19.0,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      decoration:
                          Provider.of<PlanProvider>(context, listen: false)
                              .inputDecoration(),
                      controller: _harvestCostController,
                      focusNode: widget.harvestCostFocusNode,
                      onSaved: (String? val) {},
                      textInputAction: TextInputAction.done,
                      inputFormatters: [
                        CurrencyTextInputFormatter(
                          locale: 'ko',
                          decimalDigits: 2,
                          symbol: 'Rs ',
                        )
                      ],
                      keyboardType: TextInputType.number,
                      validator: (val) {
                        if (val != null && val.isEmpty) {
                          return 'Cost cannot be empty.';
                        } else {
                          setState(() {
                            getCost = val.toString();
                          });
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15.0),
                    const Text(
                      "Enter Month",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19.0,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      decoration:
                          Provider.of<PlanProvider>(context, listen: false)
                              .inputDecoration(pIcon: 'Search'),
                      controller: _harvestMonthController,
                      focusNode: widget.harvestMonthFocusNode,
                      onSaved: (String? value) {},
                      textInputAction: TextInputAction.done,
                      onTap: () async {
                        FocusScope.of(context).requestFocus(FocusNode());
                        DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2024),
                        );
                        if (newDate == null) {
                          return;
                        }
                        setState(() {
                          getMonth = DateFormat('yyyy-MM').format(newDate);
                          setState(() {
                            _harvestMonthController.text = getMonth;
                          });
                        });
                      },
                      validator: (val) {
                        if (val != null && val.isEmpty) {
                          return 'History date cannot be empty.';
                        } else {
                          setState(() {
                            getMonth = val.toString();
                          });
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15.0),
                    const Text(
                      "Bigger Pineapples (kgs)",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19.0,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      decoration:
                          Provider.of<PlanProvider>(context, listen: false)
                              .inputDecoration(),
                      controller: _harvestbiggerPineappleController,
                      focusNode: widget.biggerPineapplesFocusNode,
                      onSaved: (String? val) {},
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.number,
                      validator: (val) {
                        if (val != null && val.isEmpty) {
                          return 'This Field cannot be empty.';
                        } else {
                          setState(() {
                            getQuantityBiggerGreen = val.toString();
                          });
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15.0),
                    const Text(
                      "Small Pineapples (kgs)",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19.0,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      decoration:
                          Provider.of<PlanProvider>(context, listen: false)
                              .inputDecoration(),
                      controller: _harvestSmallPineappleController,
                      focusNode: widget.smallPineapplesFocusNode,
                      onSaved: (String? val) {},
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.number,
                      validator: (val) {
                        if (val != null && val.isEmpty) {
                          return 'This Field cannot be empty.';
                        } else {
                          setState(() {
                            getQuantitySmallGreen = val.toString();
                          });
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15.0),
                    const Text(
                      "Damaged Pineapples (kgs)",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19.0,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      decoration:
                      Provider.of<PlanProvider>(context, listen: false)
                          .inputDecoration(),
                      controller: _harvestDamagedPineappleController,
                      focusNode: widget.damagedPineapplesFocusNode,
                      onSaved: (String? val) {},
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.number,
                      validator: (val) {
                        if (val != null && val.isEmpty) {
                          return 'This Field cannot be empty.';
                        } else {
                          setState(() {
                            getQuantityDamaged = val.toString();
                          });
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15.0),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        height: 60, //height of button
                        width: 120, //width of button
                        child: ElevatedButton(
                          onPressed: () async {
                            widget.harvestCostFocusNode.unfocus();
                            widget.harvestMonthFocusNode.unfocus();
                            widget.biggerPineapplesFocusNode.unfocus();
                            widget.biggerPineapplesFocusNode.unfocus();

                            if (_addInputsFormKey.currentState!.validate()) {
                              setState(() {
                                _isProcessing = true;
                              });

                              double? FreshPrice = 0.0;
                              var FreshPriceApi = await getFreshPriceApi(getMonth) ;
                              FreshPrice = double.parse((FreshPriceApi as double).toStringAsFixed(2));

                              double? ProcessedPrice1 = 0.0;
                              var ProcessedPrice1Api = await getProcessPrice1Api(getMonth) ;
                              ProcessedPrice1 = double.parse((ProcessedPrice1Api as double).toStringAsFixed(2));

                              double? ProcessedPrice2 = 0.0;
                              var ProcessedPrice2Api = await getProcessPrice2Api(getMonth) ;
                              ProcessedPrice2 = double.parse((ProcessedPrice2Api as double).toStringAsFixed(2));

                              if(_isProcessing){
                                showDialog(
                                    context: context,
                                    builder: (_) => AssetGiffDialog(
                                      onlyOkButton: true,
                                      buttonOkColor: Color(0xff809b7b),
                                      image: Image.asset(
                                        "assets/product_plan/running_pineapple.gif",
                                        fit: BoxFit.fill,
                                      ),
                                      title: const Text(
                                        "Processing...",
                                        style: TextStyle(
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      description: const Text(
                                        'Please wait this may take some time',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 19.0),
                                      ),
                                      entryAnimation: EntryAnimation.top,
                                      onOkButtonPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ));
                              }
                              Map<String,dynamic> optimizationResult = await getOptimizationResult(getCost, getMonth, getQuantityBiggerGreen, getQuantitySmallGreen);
                              Map<String,dynamic> productPrices1 = await getProductPrices1(getQuantitySmallGreen);
                              Map<String,dynamic> productPrices2 = await getProductPrices2(getQuantitySmallGreen);
                              Map<String,dynamic> productPrices3 = await getProductPrices3(getQuantitySmallGreen);
                              Map<String,dynamic> productPrices = {
                                ...productPrices1,
                                ...productPrices2,
                                ...productPrices3,
                              };

                              if(productPrices.containsKey("none")){
                                _isProcessing = true;
                                showDialog(
                                    context: context,
                                    builder: (_) => AssetGiffDialog(
                                      onlyOkButton: true,
                                      buttonOkColor: Color(0xff809b7b),
                                      image: Image.asset(
                                        "assets/product_plan/pointing.gif",
                                        fit: BoxFit.fill,
                                      ),
                                      title: const Text(
                                        "Network Issue...",
                                        style: TextStyle(
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      description: const Text(
                                        'Please try again in few Minutes',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 19.0),
                                      ),
                                      entryAnimation: EntryAnimation.top,
                                      onOkButtonPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ));
                              }else {
                                //  getFreshPriceApi();

                                Map<String, double?> prices = {
                                  "Fresh": FreshPrice,
                                  "Processed1": ProcessedPrice1,
                                  "Processed2": ProcessedPrice2,
                                };


                                setState(() {
                                  _isProcessing = false;

                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ForecastResultGraphs(
                                            month: getMonth,
                                            prices: prices,
                                            optimizationResult: optimizationResult,
                                            productPrices: productPrices,
                                            damagedPineapple: getQuantityDamaged,
                                          ),
                                    ),
                                  );
                                });
                              } } else {
                              print(0);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            //maximumSize: Size.infinite,
                            primary: Color(0xff809b7b),
                            //fixedSize: Size(10.0, 20)
                          ),
                          child: (!_isProcessing)
                              ? const Text(
                                  'Go',
                                  style: TextStyle(fontSize: 25),
                                )
                              : const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.redAccent,
                                  ),
                                ),


                        ),
                      ),
                    ),
                  ]
              ),
            )
        )
    );
  }
}
