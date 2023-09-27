import 'package:flutter/material.dart';
import 'package:umbiapps/widgets/itempay.dart';
import 'package:umbiapps/widgets/paybar2.dart';
class pesananSayaPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          payBarii(),
          Container(
            height: 700,
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                ItemPay(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}