import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sipfaa_app/models/wholeSalerModel.dart';

class WholesalerOutput extends StatefulWidget {
  final int rating;
  final String tasteQuality;
  final String priceRang;
  //final RangeValues priceRang;
  final String quantityRange;
  final String lat;
  final String long;

  const WholesalerOutput(
      {Key? key,
        required this.rating,
        required this.tasteQuality,
        required this.priceRang,
        required this.quantityRange,
        required this.lat,
        required this.long,
      })
      : super(key: key);

  @override
  State<WholesalerOutput> createState() => _FarmerOutputState();
}

class _FarmerOutputState extends State<WholesalerOutput> {
  var getPrice;
  var getQuantity;
  var getRating;
  var getTaste;
  var newData;

  Future getWholeSellers() async {
    if (widget.priceRang != null &&
        widget.rating != null &&
        widget.quantityRange != null) {
      await checkConditions(
           widget.rating);
    }
    var url = Uri.parse('https://sipfaa-buyer-seller-backend-v1.herokuapp.com/wholesalers');
    var response = await http.get(url, headers: {
      "price": getPrice,
      "quantity": getQuantity,
      "tasteQuality": getTaste,
      "rate": getRating,
      "lat": widget.lat,
      "long": widget.long,
    });
    print("Data : ");
    // var res = await json.decode(response.body);
    return response.body;
  }

  checkConditions(int rating) {
    getTaste = widget.tasteQuality;
    getPrice = widget.priceRang;
    getQuantity = widget.quantityRange;

    if (rating == 1) {
      getRating = 'high';
    } else {
      getRating = 'low';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        toolbarHeight: 130,
        backgroundColor: Color(0xff809b7b),
        title: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Pineapple Wholesalers'),
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
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: FutureBuilder(
                  future: getWholeSellers(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasError && snapshot.data != null) {
                      newData = json.decode(snapshot.data.toString());
                      if(newData.length>0){
                      return ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                              columns: const [
                                DataColumn(label: Text('Id',style: TextStyle(fontStyle: FontStyle.italic),),),
                                DataColumn(label: Text('Price',style: TextStyle(fontStyle: FontStyle.italic),),),
                                DataColumn(label: Text('Quantity',style: TextStyle(fontStyle: FontStyle.italic),),),
                                DataColumn(label: Text('Location',style: TextStyle(fontStyle: FontStyle.italic),),),
                                DataColumn(label: Text('Address',style: TextStyle(fontStyle: FontStyle.italic),),),
                              ],
                              rows: List<DataRow>.generate(
                                  newData.length,
                                      (index) => DataRow(
                                      cells: [
                                        DataCell(Text(newData[index]['WholesellerId'].toString())),
                                        DataCell(Text(newData[index]['price'].toString())),
                                        DataCell(Text(newData[index]['Quantity'].toString())),
                                        DataCell(ConstrainedBox(
                                              constraints: BoxConstraints(maxWidth: 200),
                                              child: Text(newData[index]['City'].toString(),overflow: TextOverflow.ellipsis ,)
                                        ),
                                        ),
                                        DataCell(Text(newData[index]['Address'].toString())),
                                      ]
                                  )
                              )
                          ),
                        ),
                      );}else{
                        return const Center(
                          child: Text(
                            "Sorry!! No Data Found",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.0,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold),
                          ),
                        );
                      }
                    } else {
                      return const ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            child: CircularProgressIndicator(
                              color: Colors.red,
                            ),
                            height: 50.0,
                            width: 50.0,
                          ),
                        ),
                      );
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
