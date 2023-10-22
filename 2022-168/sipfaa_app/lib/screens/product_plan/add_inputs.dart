import 'package:flutter/material.dart';
import 'package:sipfaa_app/components/product_plan/add_inputs_form.dart';

class AddUserInputsPlan extends StatelessWidget {
  AddUserInputsPlan({Key? key}) : super(key: key);

  final FocusNode _harvestCostFocusNode = FocusNode();
  final FocusNode _harvestMonthFocusNode = FocusNode();
  final FocusNode _biggerPineapplesFocusNode = FocusNode();
  final FocusNode _smallPineapplesFocusNode = FocusNode();
  final FocusNode _damagedPineapplesFocusNode = FocusNode();

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
                  Text('Product Differentiation Plan'),
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
                          child: AddInputsPlanForm(
                            harvestMonthFocusNode: _harvestMonthFocusNode,
                            biggerPineapplesFocusNode:
                                _biggerPineapplesFocusNode,
                            smallPineapplesFocusNode: _smallPineapplesFocusNode,
                            harvestCostFocusNode: _harvestCostFocusNode, damagedPineapplesFocusNode: _damagedPineapplesFocusNode,
                          )))),
            ],
          ),
        ),
      ),
    );
  }
}
