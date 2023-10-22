import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/InputFarmerSelectionForm.dart';

class InputFarmerSelection extends StatelessWidget {
  InputFarmerSelection({Key? key}) : super(key: key);

  final FocusNode _pineapplePriceRangeFocusNode = FocusNode();
  final FocusNode _pineappleQuantityRangeFocusNode = FocusNode();
  final FocusNode _pineappleTasteQualityRangeFocusNode = FocusNode();
  final FocusNode _pineappleRateRangeFocusNode = FocusNode();

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
                  Text('Select The Best Farmers'),
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
                          child: InputfarmerSelectionForm(
                            pineapplePriceRangeFocusNode: _pineapplePriceRangeFocusNode,
                            pineappleQuantityRangeFocusNode: _pineappleQuantityRangeFocusNode,
                            pineappleTasteQualityRangeFocusNode: _pineappleTasteQualityRangeFocusNode,
                            pineappleRateRangeFocusNode: _pineappleRateRangeFocusNode,
                          )
                      ))),
            ],
          ),
        ),
      ),
    );
  }



}


